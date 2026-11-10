<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customorder.aspx.cs" Inherits="CAKEBYTE_POS.Customer.track" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" type="text/css" href="[stylesheets]/navi.css"/>
    <link rel="stylesheet" type="text/css" href="[stylesheets]/cust_ord.css"/>
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
        <a href="menu.aspx">Menu</a>
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








    <div class="container">
    <!-- Custom Order on the Left -->
    <div class="column">
        <h2>Custom Order</h2>
        <form action="#" method="post">
            <label for="flavor">Cake Flavor</label>
            <select id="flavor" name="flavor" required>
                <option value="chocolate">Chocolate</option>
                <option value="vanilla">Vanilla</option>
                <option value="red_velvet">Red Velvet</option>
                <option value="strawberry">Strawberry</option>
                <option value="forest">Black Forest</option>
                <option value="mocha">Mocha</option>
                <option value="macha">Macha</option>
                <option value="fererro">Fererro</option>
            </select>

            <label for="size">Cake Size</label>
            <select id="size" name="size" required>
                <option value="6">6 inches</option>
                <option value="8">8 inches</option>
                <option value="10">10 inches</option>
            </select>

            <label for="design">Custom Design Description</label>
            <textarea id="design" name="design" rows="4" placeholder="Describe your custom cake design..." required></textarea>

             <label for="cakeImage">Upload an Inspo or Sample Cake Image:</label>
                <input type="file" id="cakeImage" name="cakeImage" accept="image/*" required>
                

                <label for="event">Event Type for the Order</label>
            <select id="event" name="event" required>
                <option value="bday">Birthday</option>
                <option value="wedding">Wedding</option>
                <option value="anni">Anniversary</option>
                <option value="grad">Graduation</option>
                <option value="valen">Valentine's Day</option>
                <option value="chris">Chirstmas</option>
                <option value="year">New Year</option>
            </select>  
            
            
        </form>
    </div>

    <!-- Customer Details on the Right -->
    <div class="column">
        <h2>Customer Details</h2>
        <form>
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="date">Pickup/Delivery Date</label>
            <input type="date" id="date" name="date" required>

            <label for="delivery">Delivery Option</label>
            <select id="delivery" name="delivery" required>
                <option value="pickup">Pickup</option>
                <option value="delivery">Delivery</option>
            </select>

            <label for="payment">Payment Method</label>
            <select id="payment" name="payment" required>
                <option value="paypal">Paypal</option>
                <option value="gcash">Gcash</option>
                <option value="cash_on_delivery">Cash on Delivery</option>
            </select>

            <button type="submit">Place Order</button>

        </form>
    </div>
</div>

<script>

    document.getElementById('cakeImage').addEventListener('change', function (event) {
        const file = event.target.files[0];
        const previewContainer = document.getElementById('imagePreview');
        previewContainer.innerHTML = ''; // Clear previous preview

        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                previewContainer.appendChild(img);
            };
            reader.readAsDataURL(file);
        } else {
            previewContainer.innerHTML = '<p>No image uploaded</p>';
        }
    });

</script>



        </div>
    </form>
</body>
</html>
