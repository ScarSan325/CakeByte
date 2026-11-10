*<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="CAKEBYTE_POS.Customer.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" type="text/css" href="[stylesheets]/navi.css"/>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div></div>

            
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
        <div class="about_ni">
            <h2>About CakeByte Hub</h2>
            <p>Welcome to CakeByte Hub, your go-to place for freshly baked goods, custom cakes, and delightful pastries. Our passion is to bring joy through every bite!</p>
        </div>
        
        <h3>Why Choose Us?</h3>
        <div class="why-choose-us section">
            <div class="box">Secure Login & Registration</div>
            <div class="box">Custom Orders & Real-time Tracking</div>
            <div class="box">Multiple Payment Methods</div>
            <div class="box">Exclusive Seasonal Promotions</div>
        </div>
        
        <div class="mission-story section">
            <div class="mission"><h3>Our Mission</h3><p>We aim to create the best bakery experience by using the finest ingredients, crafting unique flavors, and ensuring customer satisfaction in every order.</p></div>
            <div class="story"><h3>Our Story</h3><p>CakeByte Hub started as a small family-owned bakery with a dream to spread happiness through delicious treats. Over the years, we have grown into a beloved community bakery, known for our creativity, quality, and exceptional customer service.</p></div>
        </div>
        
        <h3>Meet Our Team</h3>
        <div class="team section">
            <div class="team-member">
                <img src="team1.jpg" alt="Ma. Scarlette Sanoy">
                <p><strong>Ma. Scarlette Sanoy</strong><br>Head Baker</p>
            </div>
            <div class="team-member">
                <img src="team2.jpg" alt="Rafael Moises Beltran">
                <p><strong>Rafael Moises Beltran</strong><br>Pastry Chef</p>
            </div>
        </div>
        

    


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


<style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff3f3;
            
        }
    .container {
        text-align: center;
        margin: 100px auto 0; /* Ensures top margin and centers horizontally */
        width: 100%;
        max-width: 1200px;
        padding: 20px;
        position: relative;
        z-index: 1;
        display: flex;
        flex-direction: column;
        align-items: center; /* Centers content inside */
        justify-content: center;
    }
        .section {
            margin-bottom: 40px;
        }
        .about_ni {
            background: #ffdde5;
            padding: 30px;
            border-radius: 10px;
        }
        .why-choose-us {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }
        .box {
            width: 220px;
            height: 160px;
            background: #fff;
            border: 2px solid #d6336c;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            padding: 10px;
            text-align: center;
        }
        .mission-story {
            display: flex;
            gap: 40px;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .mission, .story {
            background: #ffdde5;
            padding: 30px;
            flex: 1;
            border-radius: 10px;
            min-width: 400px;
        }
        .team {
            display: flex;
            justify-content: center;
            gap: 60px;
            flex-wrap: wrap;
        }
        .team-member {
            text-align: center;
        }
        .team-member img {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #D6336C;
        }




        .footer {
    background: #FFB6C1;
    padding: 40px 10%;
    color: #fff;
    display: flex;
    justify-content: center;
    width: 110%;
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
    color: white; 
}











        
    </style>