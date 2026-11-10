<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="voucher.aspx.cs" Inherits="CAKEBYTE_POS.Admin.inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>
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
        <div class="sidebarss">
            <button onclick="showTab('add-voucher')">Add Voucher</button>
            <button onclick="showTab('list-vouchers')">Voucher List</button>
            <button onclick="showTab('delete-vouchers')">Delete Voucher</button>
        </div>

        <div class="main-content" id="add-voucher">
            <h2>Add Voucher</h2>
            <div class="form-group">
                <label for="voucher-code">Voucher Code</label>
                <input type="text" id="voucher-code" placeholder="Enter voucher code">
            </div>
            <div class="form-group">
                <label for="discount">Discount Amount (%)</label>
                <input type="number" id="discount" min="1" max="100" placeholder="Enter discount percentage">
            </div>
            <div class="form-group">
                <label for="min-purchase">Minimum Purchase Amount</label>
                <input type="number" id="min-purchase" min="1" placeholder="Enter minimum purchase amount">
            </div>
            <div class="form-group">
                <label for="start-date">Start Date</label>
                <input type="date" id="start-date">
            </div>
            <div class="form-group">
                <label for="end-date">End Date</label>
                <input type="date" id="end-date">
            </div>
            <button class="form-button" onclick="addVoucher()">Add Voucher</button>
        </div>




    <div class="main-content hidden" id="list-vouchers">
    <h2>Voucher List</h2>
    <div id="voucher-list" class="voucher-list"></div>
</div>

<div class="main-content hidden" id="delete-vouchers">
    <h2>Delete Voucher</h2>
    <div id="delete-voucher-list" class="voucher-list"></div>
</div>




    </div>




    <script>
        function showTab(tabId) {
            document.getElementById('add-voucher').classList.add('hidden');
            document.getElementById('list-vouchers').classList.add('hidden');
            document.getElementById('delete-vouchers').classList.add('hidden');

            document.getElementById(tabId).classList.remove('hidden');
        }






        function addVoucher() {
            const code = document.getElementById('voucher-code').value.trim();
            const discount = document.getElementById('discount').value.trim();
            const minPurchase = document.getElementById('min-purchase').value.trim();
            const startDate = document.getElementById('start-date').value;
            const endDate = document.getElementById('end-date').value;

            if (code && discount && minPurchase && startDate && endDate) {
                const voucherList = document.getElementById('voucher-list');
                const deleteList = document.getElementById('delete-voucher-list');

                // Voucher Card for Display
                const voucherCard = document.createElement('div');
                voucherCard.className = 'voucher-card';
                voucherCard.innerHTML = `
            <p><strong>Code:</strong> ${code}</p>
            <p><strong>Discount:</strong> ${discount}%</p>
            <p><strong>Minimum Purchase:</strong> $${minPurchase}</p>
            <p><strong>Start Date:</strong> ${startDate}</p>
            <p><strong>End Date:</strong> ${endDate}</p>
        `;
                voucherList.appendChild(voucherCard);

                // Voucher Card for Delete Section
                const deleteCard = document.createElement('div');
                deleteCard.className = 'voucher-card';
                deleteCard.innerHTML = `
            <p><strong>Code:</strong> ${code}</p>
            <p><strong>Discount:</strong> ${discount}%</p>
            <p><strong>Minimum Purchase:</strong> $${minPurchase}</p>
            <p><strong>Start Date:</strong> ${startDate}</p>
            <p><strong>End Date:</strong> ${endDate}</p>
        `;
                const deleteBtn = document.createElement('button');
                deleteBtn.textContent = 'Delete';
                deleteBtn.className = 'delete-btn';

                deleteBtn.onclick = function () {
                    const confirmDelete = confirm(`Are you sure you want to delete the voucher "${code}"?`);
                    if (confirmDelete) {
                        voucherList.removeChild(voucherCard);
                        deleteList.removeChild(deleteCard);
                    }
                };

                deleteCard.appendChild(deleteBtn);
                deleteList.appendChild(deleteCard);

                // Clear form fields
                document.getElementById('voucher-code').value = "";
                document.getElementById('discount').value = "";
                document.getElementById('min-purchase').value = "";
                document.getElementById('start-date').value = "";
                document.getElementById('end-date').value = "";
            } else {
                alert("Please fill in all fields.");
            }
        }


    </script>


</body>
</html>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            cursor:pointer;
        }
        body {
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
        }
        .container {
            display: flex;
            width: 70%;
            height: 580px;
            background: white;
            border-radius: 30px;
            box-shadow: #422800 4px 4px 0 0;
            border: 2px solid #422800;
            overflow: hidden;
            margin-top: 80px;
        }
        .sidebarss {
           width: 30%;
            background: #FFB6C1; /*  f8a2c3   */
            display: flex;
            flex-direction: column;
            padding: 20px;
        }
        .sidebarss button {
             padding: 15px;
            margin: 5px 0;
            background: none;
            border: none;
            color: black;
            font-size: 20px;
            cursor: pointer;
            text-align: center;
            border-radius: 5px;
        }
        .sidebarss button:hover {
            background: #D6336C;  /*D6336C*/
            color: white;
        }
        .main-content {
            flex-grow: 1;
            padding: 10px;
            overflow-y: auto;

        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-button {
            width: 100%;
            padding: 12px;
            background: #ffb6c1;
            border: none;
            color: black;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        .form-button:hover {
            background: #d95379;
            color: white;
        }
        .hidden {
            display: none;
        }

.voucher-list {
    display: flex;
    flex-direction: column;
    gap: 15px;
    margin-top: 15px;
}

.voucher-card {
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 15px;
    background-color: #fff0f5;
    box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}

.voucher-card p {
    margin: 5px 0;
    font-size: 16px;
}

.delete-btn {
    margin-top: 10px;
    padding: 6px 12px;
    border: none;
    background: #d95379;
    color: white;
    cursor: pointer;
    border-radius: 5px;
    font-size: 14px;
}


    </style>