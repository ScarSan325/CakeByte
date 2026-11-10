<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sales.aspx.cs" Inherits="CAKEBYTE_POS.Admin.sales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="admin_style/sales.css"/>
    <link rel="stylesheet" type="text/css" href="admin_style/nav_admin.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
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




    <div class="container">
        <h1>Sales Management</h1>

        <div class="sales-summary">
            <div class="sales-box">
                <h3>Total Sales</h3>
                <p id="totalSales">$0</p>
            </div>
            <div class="sales-box">
                <h3>Orders Today</h3>
                <p id="ordersToday">0</p>
            </div>
            <div class="sales-box">
                <h3>Best Seller</h3>
                <p id="bestSeller">-</p>
            </div>
        </div>
        
        <div class="sales-filters">
            <button onclick="filterSales('daily')">Daily</button>
            <button onclick="filterSales('weekly')">Weekly</button>
            <button onclick="filterSales('monthly')">Monthly</button>
            <button onclick="filterSales('annual')">Annual</button>
        </div>
        


        <div id="monthlyFilterBox" style="display: none;">
    <label for="monthFilter">Select Month and Year:</label>
    <input type="month" id="monthFilter" onchange="filterMonthlySales()" />
</div>

        
        <div id="salesList" class="sales-list"></div>
    </div>
    

<script>
    let sales = [
        { item: "Chocolate Cake", price: 20, date: "2025-03-22" },
        { item: "Cupcake", price: 5, date: "2025-03-21" },
        { item: "Croissant", price: 7, date: "2025-03-15" },
        { item: "Chocolate Cake", price: 20, date: "2025-02-28" },
        { item: "Donut", price: 3, date: "2025-01-15" },
        { item: "Brownie", price: 8, date: "2025-02-10" },
        { item: "Croissant", price: 7, date: "2025-02-28" },
        { item: "Cupcake", price: 5, date: "2024-11-05" }
    ];

    function formatDate(dateStr) {
        let options = { year: 'numeric', month: 'long', day: 'numeric' };
        return new Date(dateStr).toLocaleDateString(undefined, options);
    }

    function updateSales(filteredSales = sales) {
        let totalSales = 0;
        let ordersToday = filteredSales.length;
        let productCount = {};

        let salesList = document.getElementById("salesList");
        salesList.innerHTML = "";

        filteredSales.forEach(sale => {
            totalSales += sale.price;
            productCount[sale.item] = (productCount[sale.item] || 0) + 1;

            let div = document.createElement("div");
            div.className = "sale-entry";
            div.innerHTML = `
                <div class="sale-details">
                    <strong>${sale.item}</strong>
                    <span class="sale-date">${formatDate(sale.date)}</span>
                </div>
                <span class="sale-price">₱${sale.price}</span>
            `;
            salesList.appendChild(div);
        });

        document.getElementById("totalSales").textContent = `₱${totalSales}`;
        document.getElementById("ordersToday").textContent = ordersToday;

        let bestSeller = Object.keys(productCount).reduce((a, b) => productCount[a] > productCount[b] ? a : b, "-");
        document.getElementById("bestSeller").textContent = bestSeller;
    }

    function filterSales(period) {
        let today = new Date();
        let filteredSales = [];
        document.getElementById("monthlyFilterBox").style.display = "none"; // Hide monthly filter by default

        if (period === 'daily') {
            filteredSales = sales.filter(sale => {
                let saleDate = new Date(sale.date);
                return saleDate.toDateString() === today.toDateString();
            });
        }
        else if (period === 'weekly') {
            let oneWeekAgo = new Date();
            oneWeekAgo.setDate(today.getDate() - 7);
            filteredSales = sales.filter(sale => {
                let saleDate = new Date(sale.date);
                return saleDate >= oneWeekAgo && saleDate <= today;
            });
        }
        else if (period === 'monthly') {
            document.getElementById("monthlyFilterBox").style.display = "block"; // Show monthly filter
        }
        else if (period === 'annual') {
            filteredSales = sales.filter(sale => {
                let saleDate = new Date(sale.date);
                return saleDate.getFullYear() === today.getFullYear();
            });
        }

        // If it's not monthly, update with filtered results
        if (period !== 'monthly') {
            updateSales(filteredSales);
        }
    }

    function filterMonthlySales() {
        let monthYear = document.getElementById("monthFilter").value;
        let filteredSales = sales.filter(sale => {
            let saleDate = new Date(sale.date);
            let saleMonthYear = saleDate.toISOString().slice(0, 7); // Get 'YYYY-MM' format
            return saleMonthYear === monthYear;
        });

        if (filteredSales.length === 0) {
            document.getElementById("salesList").innerHTML = "<p>No sales found for this month.</p>";
        } else {
            updateSales(filteredSales);
        }
    }

    // Initialize the page with all sales
    updateSales();
</script>




</body>
</html>

<style>
    * {
    cursor: pointer;
}
</style>