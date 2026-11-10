<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home_admin.aspx.cs" Inherits="CAKEBYTE_POS.Admin.o_t" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="admin_style/nav_admin.css"/>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>


    </style>

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





     <h1 style="text-align: center; color: #D6336C;">******</h1>
    
    <div class="dashboard">
        <div class="card">
            <h2>Total Sales</h2>
            <p>P52</p>
            <button onclick="location.href='sales.aspx'">View Sales</button>
        </div>
        <div class="card">
            <h2>Order Summary</h2>
            <p>56 Pending Orders</p>
            <button onclick="location.href='ot.aspx'">Track Order</button>
        </div>
        <div class="card">
            <h2>Promotion Management</h2>
            <p>3 Active Promotions</p>
            <button onclick="location.href='voucher.aspx'">Manage Voucher</button>
        </div>
    </div>
    
    <div class="dashboard two-columns">
        <div class="section">
            <h2>Product Inventory Management</h2>
            <table>
                <tr>
                    <th>Product</th>
                    <th>Stock</th>
                    <th>Price</th>
                </tr>
                <tr>
                    <td>Croissant</td>
                    <td>20</td>
                    <td>P3</td>
                </tr>
                <tr>
                    <td>Cake</td>
                    <td>15</td>
                    <td>P25</td>
                </tr>
            </table>
            <button onclick="location.href='inventory.aspx'">Manage Products</button>
        </div>
        
        <form id="form1" runat="server">
    <div class="section">
        <h2>Sales Report</h2>
        <canvas id="salesChart"></canvas>
    </div>
</form>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const ctx = document.getElementById('salesChart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                    datasets: [{
                        label: 'Sales ($)',
                        data: [500, 700, 900, 1100, 1300, 1600, 2000],
                        borderColor: 'blue',
                        fill: false
                    }]
                }
            });
        });
    </script>









</body>
</html>
    <style>

        .site-name {
    font-size: 30px;
    font-weight: 500;
    margin-left: 20px;
    color: #422800;
}

        * {
    cursor: pointer;
}
        body {
            font-family: "Poppins", sans-serif;
            background-color: #fff3f3;
            margin: 0;
            padding: 20px;
        }
        .dashboard {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }


        .dashboard.two-columns {
            margin-top: 10px;
            grid-template-columns: repeat(2, 1fr);

        }
        .card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: #422800 4px 4px 0 0;
            border: 2px solid #422800;
            text-align: center;
            border:;
        }
        .section {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: #422800 4px 4px 0 0;
            border: 2px solid #422800;        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #ffcc80;
        }
         h2 {
            font-size: 28px;
            color: #D6336C;
        }


        button {
            padding: 10px 20px;
            border-radius: 10px 10px;
            font-weight: bold;
            background: #d81b60;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover { 
            background-color: #ffdde5;
            color: #D6336C;
        }
    </style>