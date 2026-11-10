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
                    <asp:Image ID="logoImage" runat="server" ImageUrl="[img]/logo.png" AlternateText="CakeByte Hub Logo" />
                </a>
            </div>
            <div class="site-name">CakeByte Hub</div>
        </div>
        
        <div class="right-section">
            <div class="account">
                <asp:Button ID="logoutBtn" runat="server" Text="Logout" CssClass="logout-button" />
            </div>
            <div class="menu-icon" id="menuIcon">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </div>
    
    <!-- SIDEBAR NAVIGATION (Right Side) -->
    <div class="sidebar" id="sidebar">
        <span class="close-btn" id="closeSidebar">&times;</span>
        <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="c_home.aspx">Home</asp:HyperLink>
        <asp:HyperLink ID="menuLink" runat="server" NavigateUrl="menu.aspx">Menu</asp:HyperLink>
        <asp:HyperLink ID="customOrderLink" runat="server" NavigateUrl="customorder.aspx">Custom Order</asp:HyperLink>
        <asp:HyperLink ID="cartLink" runat="server" NavigateUrl="cart.aspx">Cart</asp:HyperLink>
        <asp:HyperLink ID="trackLink" runat="server" NavigateUrl="track.aspx">Track Order</asp:HyperLink>
        <asp:HyperLink ID="aboutLink" runat="server" NavigateUrl="about.aspx">About</asp:HyperLink>
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
        <asp:Panel ID="CustomOrderPanel" runat="server">
            <asp:Label runat="server" AssociatedControlID="flavor" Text="Cake Flavor" />
            <asp:DropDownList ID="flavor" runat="server" required="true">
                <asp:ListItem Value="chocolate">Chocolate</asp:ListItem>
                <asp:ListItem Value="vanilla">Vanilla</asp:ListItem>
                <asp:ListItem Value="red_velvet">Red Velvet</asp:ListItem>
                <asp:ListItem Value="strawberry">Strawberry</asp:ListItem>
                <asp:ListItem Value="forest">Black Forest</asp:ListItem>
                <asp:ListItem Value="mocha">Mocha</asp:ListItem>
                <asp:ListItem Value="macha">Macha</asp:ListItem>
                <asp:ListItem Value="fererro">Fererro</asp:ListItem>
            </asp:DropDownList>

            <asp:Label runat="server" AssociatedControlID="size" Text="Cake Size" />
            <asp:DropDownList ID="size" runat="server" required="true">
                <asp:ListItem Value="6">6 inches</asp:ListItem>
                <asp:ListItem Value="8">8 inches</asp:ListItem>
                <asp:ListItem Value="10">10 inches</asp:ListItem>
            </asp:DropDownList>

            <asp:Label runat="server" AssociatedControlID="design" Text="Custom Design Description" />
            <asp:TextBox ID="design" runat="server" TextMode="MultiLine" Rows="4" placeholder="Describe your custom cake design..." required="true"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="cakeImage" Text="Upload an Inspo or Sample Cake Image:" />
            <asp:FileUpload ID="cakeImage" runat="server" required="true" />

            <asp:Label runat="server" AssociatedControlID="event" Text="Event Type for the Order" />
            <asp:DropDownList ID="event" runat="server" required="true">
                <asp:ListItem Value="bday">Birthday</asp:ListItem>
                <asp:ListItem Value="wedding">Wedding</asp:ListItem>
                <asp:ListItem Value="anni">Anniversary</asp:ListItem>
                <asp:ListItem Value="grad">Graduation</asp:ListItem>
                <asp:ListItem Value="valen">Valentine's Day</asp:ListItem>
                <asp:ListItem Value="chris">Christmas</asp:ListItem>
                <asp:ListItem Value="year">New Year</asp:ListItem>
            </asp:DropDownList>
        </asp:Panel>
    </div>

    <!-- Customer Details on the Right -->
    <div class="column">
        <h2>Customer Details</h2>
        <asp:Panel ID="CustomerDetailsPanel" runat="server">
            <asp:Label runat="server" AssociatedControlID="name" Text="Full Name" />
            <asp:TextBox ID="name" runat="server" required="true"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="email" Text="Email" />
            <asp:TextBox ID="email" runat="server" TextMode="Email" required="true"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="phone" Text="Phone Number" />
            <asp:TextBox ID="phone" runat="server" TextMode="Phone" required="true"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="date" Text="Pickup/Delivery Date" />
            <asp:TextBox ID="date" runat="server" TextMode="Date" required="true"></asp:TextBox>

            <asp:Label runat="server" AssociatedControlID="delivery" Text="Delivery Option" />
            <asp:DropDownList ID="delivery" runat="server" required="true">
                <asp:ListItem Value="pickup">Pickup</asp:ListItem>
                <asp:ListItem Value="delivery">Delivery</asp:ListItem>
            </asp:DropDownList>

            <asp:Label runat="server" AssociatedControlID="payment" Text="Payment Method" />
            <asp:DropDownList ID="payment" runat="server" required="true">
                <asp:ListItem Value="paypal">Paypal</asp:ListItem>
                <asp:ListItem Value="gcash">Gcash</asp:ListItem>
                <asp:ListItem Value="cash_on_delivery">Cash on Delivery</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="placeOrderBtn" runat="server" Text="Place Order" CssClass="submit-button" />
        </asp:Panel>
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
<style>
    .logout-button {
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    box-shadow: #422800 2px 2px 0 0;
    border-radius: 30px;
    color: #422800;
    padding: 5px 18px;
    background-color: transparent;
    text-align: center;
    margin-right:5px;
}

.logout-button:hover {
    color: #D6336C;
    background-color: #fff;
}


</style>