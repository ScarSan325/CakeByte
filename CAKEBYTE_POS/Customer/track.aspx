<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="track.aspx.cs" Inherits="CAKEBYTE_POS.Customer.track" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" type="text/css" href="[stylesheets]/navi.css"/>
    <link rel="stylesheet" type="text/css" href="[stylesheets]/TRACK.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>

<!-- HEADER -->
<div class="header">
    <div class="left-section">
        <div class="logo">
            <a href="c_home.aspx">
                <img src="[img]/logo.png" alt="CakeByte Hub Logo"/>
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
        <a href="c_home.aspx">Home</a>
<a href="profile.aspx">Profile</a>
<a href="menu.aspx">Products</a>
<a href="customorder.aspx">Custom Order</a>
<a href="cart.aspx">Cart</a>
<a href="track.aspx">Track Order</a>
<a href="about.aspx">About</a>
</div>

<!-- Overlay Background -->
<div class="overlay" id="overlay"></div>

<script>
    document.getElementById("accountBtn").addEventListener("click", function () {
        window.location.href = "login.aspx";
    });
</script>

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


















    <div class="tabs">
        <div class="tab active" data-tab="all" onclick="showTab('all')">ALL</div>
        <div class="tab" data-tab="pending" onclick="showTab('pending')">PENDING</div>
        <div class="tab" data-tab="delivery" onclick="showTab('delivery')">DELIVERY</div>
        <div class="tab" data-tab="cancelled" onclick="showTab('cancelled')">CANCELLED</div>
    </div>

    <div id="all" class="tab-content active"></div>
    <div id="pending" class="tab-content"></div>
    <div id="delivery" class="tab-content"></div>
    <div id="cancelled" class="tab-content"></div>

    <script>
        const orders = [
            { status: "pending", name: "Product A", quantity: 2, price: "$10", date: "2025-03-16", total: "$20" },
            { status: "delivery", name: "Product B", quantity: 1, price: "$15", date: "2025-03-15", total: "$15" },
            { status: "cancelled", name: "Product C", quantity: 3, price: "$8", date: "2025-03-14", total: "$24" }
        ];

        function createOrderCard(order) {
            return `
                <div class="order-card" data-status="${order.status}">
                    <img src="placeholder.png" alt="Product">
                    <div class="order-details">
                        <p><strong>${order.name}</strong></p>
                        <div class="order-info">
                            <p>Quantity: ${order.quantity}</p>
                            <p>Price: ${order.price}</p>
                        </div>
                        <div class="order-info">
                            <p>Date Ordered: ${order.date}</p>
                            <p>Total: ${order.total}</p>
                        </div>
                        <p class="status ${order.status}">Status: ${order.status.charAt(0).toUpperCase() + order.status.slice(1)}</p>
                    </div>
                </div>`;
        }

        function populateTabs() {
            const allTab = document.getElementById("all");
            const pendingTab = document.getElementById("pending");
            const deliveryTab = document.getElementById("delivery");
            const cancelledTab = document.getElementById("cancelled");

            allTab.innerHTML = "";
            pendingTab.innerHTML = "";
            deliveryTab.innerHTML = "";
            cancelledTab.innerHTML = "";

            orders.forEach(order => {
                allTab.innerHTML += createOrderCard(order);
                document.getElementById(order.status).innerHTML += createOrderCard(order);
            });
        }

        function showTab(tabName) {
            document.querySelectorAll(".tab").forEach(tab => tab.classList.remove("active"));
            document.querySelectorAll(".tab-content").forEach(content => content.classList.remove("active"));

            document.querySelector(`.tab[data-tab='${tabName}']`).classList.add("active");
            document.getElementById(tabName).classList.add("active");
        }

        populateTabs();
    </script>

        </div>
    </form>
</body>
</html>
<style>

    * {
    cursor: pointer;
}
</style>