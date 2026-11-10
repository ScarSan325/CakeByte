<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="CAKEBYTE_POS.Customer.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>

    <link rel="stylesheet" type="text/css" href="[stylesheets]/navi.css"/>
    <link rel="stylesheet" type="text/css" href="[stylesheets]/menu.css"/>
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














<!--contents-->
<div class= "cont-tabs">

<div class="tabs">
        <div class="tab" onclick="showContent('cake')">CAKE</div>

        <div class="tab" onclick="showContent('breads')">BREADS</div>

        

        <div class="tab" onclick="showContent('cookies')">COOKIES & BISCUITS</div>

        <div class="tab" onclick="showContent('muffins')">DONUTS & MUFFINS</div>

       

        <div class="tab" onclick="showContent('cd')">COMBO DEALS</div>
    </div>
    

    
<!-- Ubos ani kay mga content na nga imong gi assign-->


    <div id="cake" class="content">
        <div class="cake-grid">
            <div class="cake-card">
                <img src="[img]/menu/choco.jpg" alt="Chocolate Cake">
                <h3>Chocolate Cake</h3>
                <div class="cake-info">
                    <span class="price">₱15.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/bf.jpg" alt="Black Forest">
                <h3>Black Forest</h3>
                <div class="cake-info">
                    <span class="price">₱19.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/c_fruit.jpg" alt="Chocolate Fruit Cake">
                <h3>Choco Fruit Cake</h3>
                <div class="cake-info">
                    <span class="price">₱16.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/lava.jpg" alt="Choco Lava Cake">
                <h3>Choco Lava Cake</h3>
                <div class="cake-info">
                    <span class="price">₱7.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/red.jpg" alt="Red Velvet Cake">
                <h3>Red Velvet Cake</h3>
                <div class="cake-info">
                    <span class="price">₱26.49</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/vanilla.jpg" alt="Vanilla Cake">
                <h3>Vanilla Cake</h3>
                <div class="cake-info">
                    <span class="price">₱12.25</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/m.jpg" alt="Chocolate Cake">
                <h3>Matcha Cake</h3>
                <div class="cake-info">
                    <span class="price">₱7.49</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/fer.jpg" alt="Ferrero Rocher Cake">
                <h3>Ferrero Rocher Cake</h3>
                <div class="cake-info">
                    <span class="price">₱500.99</span>
                    <span class="rating">⭐ 4.2</span>
                   <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>
        </div>
    </div>







    <div id="breads" class="content">
        <div class="cake-grid">
            <div class="cake-card">
                <img src="[img]/menu/b1.jpg" alt="Chocolate Cake">
                <h3>Challah</h3>
                <div class="cake-info">
                    <span class="price">₱55.00</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/b3.jpg" alt="Black Forest">
                <h3>Focaccia</h3>
                <div class="cake-info">
                    <span class="price">₱60.00</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/b4.webp" alt="Chocolate Fruit Cake">
                <h3>Bagel</h3>
                <div class="cake-info">
                    <span class="price">₱30.00</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/b2.jpg" alt="Choco Lava Cake">
                <h3>Pain Au Lait</h3>
                <div class="cake-info">
                    <span class="price">₱45.00</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            
        </div>
    </div>









    







    <div id="cookies" class="content active">
        <div class="cake-grid">
            <div class="cake-card">
                <img src="[img]/menu/c1.jpg" alt="Chocolate Cake">
                <h3>Chocolate Chip Cookie</h3>
                <div class="cake-info">
                    <span class="price">₱15.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/c2.jpg" alt="Black Forest">
                <h3>Ginger Bread</h3>
                <div class="cake-info">
                    <span class="price">₱19.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/c3.jpg" alt="Chocolate Fruit Cake">
                <h3>Cookie Doughnut</h3>
                <div class="cake-info">
                    <span class="price">₱16.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/c4.jpg" alt="Choco Lava Cake">
                <h3>Cinnamon Sugar Twist</h3>
                <div class="cake-info">
                    <span class="price">₱7.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/c5.jpg" alt="Red Velvet Cake">
                <h3>Oatmeal Raisin</h3>
                <div class="cake-info">
                    <span class="price">₱26.49</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            
        </div>
    </div>









    <div id="cd" class="content">
        <div class="cake-grid">
            <div class="cake-card">
                <img src="[img]/menu/choco.jpg" alt="Chocolate Cake">
                <h3>Chocolate Cake</h3>
                <div class="cake-info">
                    <span class="price">₱15.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/bf.jpg" alt="Black Forest">
                <h3>Black Forest</h3>
                <div class="cake-info">
                    <span class="price">₱19.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/c_fruit.jpg" alt="Chocolate Fruit Cake">
                <h3>Choco Fruit Cake</h3>
                <div class="cake-info">
                    <span class="price">₱16.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/lava.jpg" alt="Choco Lava Cake">
                <h3>Choco Lava Cake</h3>
                <div class="cake-info">
                    <span class="price">₱7.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/red.jpg" alt="Red Velvet Cake">
                <h3>Red Velvet Cake</h3>
                <div class="cake-info">
                    <span class="price">₱26.49</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/vanilla.jpg" alt="Vanilla Cake">
                <h3>Vanilla Cake</h3>
                <div class="cake-info">
                    <span class="price">₱12.25</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/m.jpg" alt="Chocolate Cake">
                <h3>Matcha Cake</h3>
                <div class="cake-info">
                    <span class="price">₱7.49</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/fer.jpg" alt="Ferrero Rocher Cake">
                <h3>Ferrero Rocher Cake</h3>
                <div class="cake-info">
                    <span class="price">₱500.99</span>
                    <span class="rating">⭐ 4.2</span>
                   <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>
        </div>
    </div>






    <div id="muffins" class="content">
         <div class="cake-grid">
            <div class="cake-card">
                <img src="[img]/menu/d2.avif" alt="Chocolate Cake">
                <h3>Glazed</h3>
                <div class="cake-info">
                    <span class="price">₱15.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/d1.jpg" alt="Black Forest">
                <h3>Chocolate Donut</h3>
                <div class="cake-info">
                    <span class="price">₱19.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/menu/d3.webp" alt="Chocolate Fruit Cake">
                <h3>Bavarian (Choco)</h3>
                <div class="cake-info">
                    <span class="price">₱16.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            
            
        </div>
    </div>


  </div>  

    
    <script>
        function showContent(tabId) {
            document.querySelectorAll('.content').forEach(content => {
                content.classList.remove('active');
            });
            document.getElementById(tabId).classList.add('active');
            
            document.querySelectorAll('.tab').forEach(tab => {
                tab.classList.remove('active');
            });
            event.target.classList.add('active');
        }
    </script>


        </div>
    </form>
</body>
</html>
