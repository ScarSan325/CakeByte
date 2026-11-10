<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ot.aspx.cs" Inherits="CAKEBYTE_POS.Admin.o_t" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="admin_style/ot.css"/>
    <link rel="stylesheet" type="text/css" href="admin_style/nav_admin.css"/>
</head>
<body>


            
<!-- HEADER -->
<div class="header">
    <div class="left-section">
        <div class="logo">
            <a href="home_admin.aspx">
                <img src="admin_style/logo.png" alt="CakeByte Hub Logo"/>
            </a>
        </div>
        <div class="site-name">CakeByte Hub</div>
    </div>

    <div class="right-section">
        <div class="account">
            <button id="accountBtn">Logout</button>
        </div>
        <div class="menu-icon" id="menuIcon">
            <i class="fas fa-bars"></i>
        </div>
    </div>
</div>

<!-- SIDEBAR NAVIGATION (Right Side) -->
<div class="sidebar" id="sidebar">
    <span class="close-btn" id="closeSidebar">&times;</span>
    <a href="home_admin.aspx">Home</a>
    <a href="inventory.aspx">Inventory And Stocks</a>
    <a href="ot.aspx">Orders and Transactions</a>
    <a href="sales.aspx">Sales Management</a>
     <a href="voucher.aspx">Voucher Management</a>
</div>

<!-- Overlay Background -->
<div class="overlay" id="overlay"></div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
    const menuIcon = document.getElementById("menuIcon");
    const sidebar = document.getElementById("sidebar");
    const overlay = document.getElementById("overlay");
    const closeSidebar = document.getElementById("closeSidebar");

    if (menuIcon && sidebar && overlay && closeSidebar) {
        menuIcon.addEventListener("click", function () {
            console.log("Menu clicked!"); // Debugging
            sidebar.classList.add("show");
            overlay.classList.add("show");
        });

        closeSidebar.addEventListener("click", function () {
            sidebar.classList.remove("show");
            overlay.classList.remove("show");
        });

        overlay.addEventListener("click", function () {
            sidebar.classList.remove("show");
            overlay.classList.remove("show");
        });
    } else {
        console.error("Navbar elements not found!");
    }
});

</script>


    <script>
        document.getElementById("accountBtn").addEventListener("click", function () {
            // Clear session (Modify this if you're using authentication tokens)
            sessionStorage.clear();
            localStorage.clear();

            // Redirect to login page
            window.location.href = "a_login.aspx";
        });
    </script>










<div class="container">
    <h1>Order and Transaction Management</h1>
    
    <div class="admin-controls">
        <button onclick="filterOrders('all')">All</button>
        <button onclick="filterOrders('Pending')">Pending</button>
        <button onclick="filterOrders('Ready to Deliver')">Ready to Deliver</button>
        <button onclick="filterOrders('Delivered')">Delivered</button>
    </div>

    <div id="ordersList" class="order-list"></div>
</div>

<!-- MODAL FOR ORDER SUMMARY -->
<div id="orderModal" class="modal">
    <div class="modal-content">
        <span class="close-modal" id="closeModal">&times;</span>
        <h2>Order Summary</h2>
        <div id="modalDetails"></div>
    </div>
</div>

<!-- SCRIPT SECTION -->
<script>
    const orders = [
        { id: 1, customerName: "Alice", items: "Cake, Cookies", quantity: 3, flavor: "Chocolate", note: "Birthday Cake", price: 25, date: "2025-03-20", status: "Pending" },
        { id: 2, customerName: "Bob", items: "Bread", quantity: 2, flavor: "Garlic", note: "", price: 8, date: "2025-03-19", status: "Ready to Deliver" },
        { id: 3, customerName: "Charlie", items: "Pastry", quantity: 4, flavor: "Vanilla", note: "", price: 12, date: "2025-03-18", status: "Delivered" },
        { id: 4, customerName: "Diana", items: "Muffin", quantity: 6, flavor: "Blueberry", note: "", price: 5, date: "2025-03-17", status: "Pending" },
        { id: 5, customerName: "Eve", items: "Donut", quantity: 12, flavor: "Glazed", note: "For event", price: 3, date: "2025-03-16", status: "Ready to Deliver" },
        { id: 6, customerName: "Frank", items: "Bagel", quantity: 5, flavor: "Plain", note: "", price: 4, date: "2025-03-15", status: "Delivered" },
        { id: 7, customerName: "Grace", items: "Brownie", quantity: 8, flavor: "Fudge", note: "", price: 6, date: "2025-03-14", status: "Pending" }
    ];

    function updateStatus(orderId, newStatus) {
        let order = orders.find(o => o.id === orderId);
        if (order) {
            order.status = newStatus;
            renderOrders();
        }
    }

    function filterOrders(status) {
        renderOrders(status);
    }

    function renderOrders(filter = 'all') {
        const ordersList = document.getElementById('ordersList');
        ordersList.innerHTML = '';

        const filteredOrders = orders.filter(order => filter === 'all' || order.status === filter);

        if (filteredOrders.length === 0) {
            ordersList.innerHTML = `<p style="text-align:center; color: #777;">No orders found.</p>`;
            return;
        }

        filteredOrders.forEach(order => {
            const orderDiv = document.createElement('div');
            orderDiv.className = 'order';

            let statusClass = `status-${order.status.replace(/\s/g, '')}`;

            orderDiv.innerHTML = `
                <div class="order-details">
                    <p>Transaction Number: <strong>#${order.id}</strong></p>
                    <p>${order.customerName}</p>
                    <p><strong>Items:</strong> ${order.items}</p>
                    <p class="order-status ${statusClass}">Status: ${order.status}</p>
                </div>
                <div class="order-actions">
                    <p class="order-price">Price: <strong>₱${order.price.toFixed(2)}</strong></p>
                    <p>Date: <strong>${order.date}</strong></p>
                    <div class="order-buttons">
                        <button onclick="updateStatus(${order.id}, 'Ready to Deliver')">Ready</button>
                        <button onclick="updateStatus(${order.id}, 'Delivered')">Delivered</button>
                        <button onclick="viewOrder(${order.id})">View Order</button>
                    </div>
                </div>
            `;
            ordersList.appendChild(orderDiv);
        });
    }

    function viewOrder(orderId) {
        const order = orders.find(o => o.id === orderId);
        if (!order) return;

        const modalDetails = document.getElementById("modalDetails");
        modalDetails.innerHTML = `
            <p><strong>Transaction #${order.id}</strong></p>
            <p><strong>Customer:</strong> ${order.customerName}</p>
            <p><strong>Items:</strong> ${order.items}</p>
            <p><strong>Quantity:</strong> ${order.quantity}</p>
            <p><strong>Flavor:</strong> ${order.flavor}</p>
            <p><strong>Note:</strong> ${order.note || 'N/A'}</p>
            <p><strong>Price:</strong> ₱${order.price.toFixed(2)}</p>
            <p><strong>Status:</strong> ${order.status}</p>
            <p><strong>Date:</strong> ${order.date}</p>
        `;

        document.getElementById("orderModal").style.display = "block";
    }

    document.getElementById("closeModal").onclick = function () {
        document.getElementById("orderModal").style.display = "none";
    };

    window.onclick = function (event) {
        const modal = document.getElementById("orderModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };

    // Sidebar
    document.addEventListener("DOMContentLoaded", function () {
        const menuIcon = document.getElementById("menuIcon");
        const sidebar = document.getElementById("sidebar");
        const overlay = document.getElementById("overlay");
        const closeSidebar = document.getElementById("closeSidebar");

        menuIcon.addEventListener("click", function () {
            sidebar.classList.add("show");
            overlay.classList.add("show");
        });

        closeSidebar.addEventListener("click", function () {
            sidebar.classList.remove("show");
            overlay.classList.remove("show");
        });

        overlay.addEventListener("click", function () {
            sidebar.classList.remove("show");
            overlay.classList.remove("show");
        });
    });

    renderOrders();
</script>








</body>
</html>


<style type="text/css">


    <style >
    * {
        cursor:pointer;
    }


        .status-Pending {
    color: orange;
    font-weight: bold;
    background-color: yellow;
}

.status-ReadytoDeliver {
    color: teal;
    font-weight: bold;
    background-color: lightblue;
}

.status-Delivered {
    color: green;
    font-weight: bold;
    background-color: lightgreen;
}

* {
    cursor: pointer;
}


        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0; top: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            border-radius: 12px;
            width: 80%;
            max-width: 500px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            font-family: 'Poppins', sans-serif;
        }

        .close-modal {
            float: right;
            font-size: 28px;
            font-weight: bold;
            color: #555;
            cursor: pointer;
        }

        .close-modal:hover {
            color: #000;
        }

    </style>