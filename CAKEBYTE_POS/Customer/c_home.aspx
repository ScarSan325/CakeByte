<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="c_home.aspx.cs" Inherits="CAKEBYTE_POS.Customer.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    
    <link rel="stylesheet" type="text/css" href="[stylesheets]/navi.css"/>
    <link rel="stylesheet" type="text/css" href="[stylesheets]/promo.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <style>



            </style>

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
    document.getElementById("accountBtn").addEventListener("click", function() {
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






<div class="hero">
        <div class="hero-buttons">
            <a href="menu.aspx" class="btn">Order Now</a>
        </div>
</div>

<div class="why">
    <section class="why-choose-us">
    <h2> </h2>
    <div class="features">
        <div class="feature-card">
            <h3>Easy & Fast Ordering</h3>
            <p>Browse our menu, customize your cake, and place an order in just a few clicks!</p>
            
        </div>

        <div class="feature-card">
            <h3>Custom Cake Options</h3>
            <p>Personalize your cake with flavors, fillings, designs, and special messages.</p>
            
        </div>

        <div class="feature-card">
            <h3>Reliable Order Tracking & Delivery</h3>
            <p>Know exactly when your cake will be ready, with real-time tracking and reliable delivery straight to your doorstep or a convenient pickup option.</p>
            
        </div>

        <div class="feature-card">
            <h3>Exclusive Online Deals & Discounts</h3>
            <p>Enjoy special promos only available for online orders!</p>
            
        </div>
    </div>
</section>
</div>




    <section class="cakes-section">
    <h1> Our Best Seller</h1>

        <div class="cake-grid">
            <div class="cake-card">
                <img src="[img]/sample/choco.jpg" alt="Chocolate Cake">
                <h3>Chocolate Cake</h3>
                <div class="cake-info">
                    <span class="price">$15.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/sample/bf.jpg" alt="Black Forest">
                <h3>Black Forest</h3>
                <div class="cake-info">
                    <span class="price">$19.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/sample/c_fruit.jpg" alt="Chocolate Fruit Cake">
                <h3>Choco Fruit Cake</h3>
                <div class="cake-info">
                    <span class="price">$16.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/sample/lava.jpg" alt="Choco Lava Cake">
                <h3>Choco Lava Cake</h3>
                <div class="cake-info">
                    <span class="price">$7.99</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/sample/red.jpg" alt="Red Velvet Cake">
                <h3>Red Velvet Cake</h3>
                <div class="cake-info">
                    <span class="price">$26.49</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/sample/vanilla.jpg" alt="Vanilla Cake">
                <h3>Vanilla Cake</h3>
                <div class="cake-info">
                    <span class="price">$12.25</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/sample/m.jpg" alt="Chocolate Cake">
                <h3>Matcha Cake</h3>
                <div class="cake-info">
                    <span class="price">$7.49</span>
                    <span class="rating">⭐ 4.2</span>
                    <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>

            <div class="cake-card">
                <img src="[img]/sample/fer.jpg" alt="Ferrero Rocher Cake">
                <h3>Ferrero Rocher Cake</h3>
                <div class="cake-info">
                    <span class="price">$6.99</span>
                    <span class="rating">⭐ 4.2</span>
                   <button class="add-to-cart"><i class="fas fa-plus-circle"></i></button>
                </div>
            </div>
        </div>
    </section>




<footer class="footer">
    <div class="footer-container">
        <!-- Left Section -->
        <div class="footer-brand">
            <img src="[img]/logo.png" alt="CakeByte Hub Logo">
            <h2>CakeByte Hub</h2>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-google"></i></a>
                <a href="#"><i class="fas fa-times"></i></a>
            </div>
        </div>

        <!-- Middle Section -->
        <div class="footer-links">
            <div class="footer-column">
                <h3>INFO</h3>
                <a href="#">Company</a>
                <a href="#">Products</a>
                <a href="#">Brand Story</a>
                <a href="#">Services</a>
                <a href="#">Franchises</a>
            </div>
            <div class="footer-column">
                <h3>ABOUT US</h3>
                <a href="#">Gallery</a>
                <a href="#">Shops</a>
                <a href="#">Contacts</a>
            </div>
            <div class="footer-column">
                <h3>CONTACT US</h3>
                <a href="tel:+1255665">+0 (639) 915-858-5972</a>
                <a href="mail to:cakebyte@gmail.com">cakebyte@gmail.com</a>
                <p>Cebu, Philippines</p>    
            </div
        </div>

        <!-- Right Section (Contact Form) -->
        <div class="contact-form">
            <h3>CONTACT</h3>
            <p>Seeking A Customized Cake For <br> <strong>Your Special One?</strong> Text Us.</p>
            <form>
                <input type="text" placeholder="Your Name" required>
                <input type="email" placeholder="Your Email" required>
                <button type="submit">Send a request</button>
            </form>
           
    </div>

</footer>
<div class = "small_me">  <small>Privacy | All Rights Reserved © CakeByte Hub 2025</small> </div>
<!-- FontAwesome Icons -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>





<script type="text/javascript">
    
let currentIndex = 0;

function moveSlide(direction) {
    const slider = document.querySelector(".slider");
    const totalSlides = document.querySelectorAll(".feature-card").length;
    const visibleCards = 5; // Number of visible cards
    const maxIndex = totalSlides - visibleCards;

    currentIndex += direction;

    if (currentIndex < 0) {
        currentIndex = maxIndex;
    } else if (currentIndex > maxIndex) {
        currentIndex = 0;
    }

    slider.style.transform = `translateX(-${currentIndex * (100 / visibleCards)}%)`;
}

</script>





    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const accountBtn = document.getElementById("accountBtn");
            const accountDropdown = document.querySelector(".account");

            accountBtn.addEventListener("click", function(event) {
                event.stopPropagation();
                accountDropdown.classList.toggle("active");
            });

            document.addEventListener("click", function(event) {
                if (!accountDropdown.contains(event.target)) {
                    accountDropdown.classList.remove("active");
                }
            });
        });
    </script>

        </div>
    </form>
</body>
</html>


<style type="text/css">


    * {
    cursor: pointer;
}
    
    /*   footer   */
.footer {
    background: #FFB6C1;
    padding: 40px 10%;
    color: #fff;
    display: flex;
    justify-content: center;
}

.footer-container {
    display: flex;
    justify-content: space-between;
    width: 100%;
    max-width: 1200px;
}

.footer-brand {
    text-align: left;
}

.footer-brand img {
    width: 250px;
    margin-left: 0px ;
}

.footer-brand h2 {
    color: #D6336C;
    margin: 10px 0;
}

.social-icons a {
    margin: 0 10px;
    color: #D6336C;
    font-size: 20px;
    text-decoration: none;
    transition: 0.3s;
}

.social-icons a:hover {
    color: #fff;
}

.footer-links {
    display: flex;
    gap: 40px;
}

.footer-column h3 {
    color: #D6336C;
    font-size: 16px;
    margin-bottom: 10px;
}

.footer-column a {
    display: block;
    color: #fff;
    text-decoration: none;
    margin-bottom: 8px;
    transition: 0.3s;
}

.footer-column a:hover {
    color: #D6336C;
}

.contact-form {
    background: #FF5E78;
    padding: 20px;
    border-radius: 12px;
    text-align: center;
    width: 280px;
}

.contact-form h3 {
    margin-bottom: 10px;
    font-size: 14px;
    color: #fff;
}

.contact-form p {
    font-size: 14px;
    margin-bottom: 10px;
}

.contact-form input {
    width: 93%;
    padding: 10px;
    margin-bottom: 10px;
    border: none;
    border-radius: 5px;
    outline: none;
}

.contact-form button {
    background: #FFB6C1;
    color: black;
    border: none;
    padding: 10px;
    width: 100%;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

.contact-form button:hover {
    background: #D6336C;
    color: #fff;
}



/* Responsive Design */
@media (max-width: 900px) {
    .footer-container {
        flex-direction: column;
        text-align: center;
    }

    .footer-links {
        flex-direction: column;
        gap: 20px;
    }

    .contact-form {
        width: 100%;
        margin-top: 20px;
    }
}

.small_me {
    display: block;
    margin-top: 0px; /* Space from contact form */
    background-color: #FF5E78; /* Matches contact form color */
    font-size: 20px;
    height: 50px;
    position: relative; /* Change from absolute */
    bottom: 0;
    width: 100vw; /* Full width */
    text-align: center;
    line-height: 50px; /* Vertically centers text */
    color: white; /* Ensure text is visible */
}


</style>