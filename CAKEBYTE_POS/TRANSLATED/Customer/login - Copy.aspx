<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CAKEBYTE_POS.Customer.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>

    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

<div class="container">
    <div class="back-button">
        <asp:Button ID="back" CssClass="fas fa-arrow-left" runat="server" Text="Back" />
    </div>
        <div class="logo">
            <a href="index.aspx">

                <img src="[img]/logo.png" alt="Logo">
            </a>
        </div>

        <h2 style="margin-top: 40px;">Login</h2>
        <form id="loginForm">

            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="email" placeholder="Email" runat="server" required="email"></asp:TextBox>
            </div>
            <div class="form-group password-container">
                <label>Password</label>
                <asp:TextBox ID="password" Type="password" placeholder="Password" runat="server" required="password"></asp:TextBox>
                <i class="fas fa-eye-slash toggle-password" onclick="togglePassword()"></i>
            </div>
            <div class="forgot-password">
                  <asp:Button ID="fpass" runat="server" Text="Forgot Password?"/>
            </div>
            <div class="button-container">
                <asp:Button ID="button" runat="server" Text="Login"/>
                <p class="signup-link">Don't have an account? <a href="signup.aspx">Sign up</a></p>
            </div>
        </form>
    </div>
    <script>
        function togglePassword() {
            const passwordField = document.getElementById("password");
            const toggleIcon = document.querySelector(".toggle-password");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleIcon.classList.remove("fa-eye-slash");
                toggleIcon.classList.add("fa-eye");
            } else {
                passwordField.type = "password";
                toggleIcon.classList.remove("fa-eye");
                toggleIcon.classList.add("fa-eye-slash");
            }
        }
    </script>





        </div>
    </form>
</body>
</html>
 <style>
        body {
    font-family: 'Poppins', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    position: relative;
    flex-direction: column;
    overflow: hidden;
}

/* Background Image with Opacity */
body::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url('[img]/logreg/LS.png') no-repeat center center/cover;
    opacity: 0.5; /* Adjust opacity (0.1 - 1) */
    z-index: -1; /* Keeps it behind the content */
}
        .container {
            width: 400px;
            background: white;
            padding: 40px 20px 20px;
            border-radius: 30px;
            box-shadow: #422800 4px 4px 0 0;
            border: 2px solid #422800;
            text-align: center;
            position: relative;
        }
        .logo {
            position: absolute;
            top: -65px;
            left: 50%;
            transform: translateX(-50%);
            background: white;
            padding: 15px;
            border-radius: 50%;
            border: 2px solid #422800;
            box-shadow: #422800 2px 2px 0 0;
            width: 100px;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .logo a {
            display: block;
            width: 100%;
            height: 100%;
        }
        .logo img {
            margin-left: -25px;
            margin-top: -24px;
            width: 150%;
            height: 150%;
            

        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin: 10px 0;
            text-align: left;
            position: relative;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        #email, #password {
            width: calc(100% - 16px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 0 auto;
            display: block;
        }
        .password-container {
            position: relative;
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(35%);
            cursor: pointer;
            color: #422800;
        }
        .forgot-password {
            font-size: 14px;
            color: #422800;
            text-align: left;
            margin-top: 5px;
        }
        .forgot-password #fpass {
            color: #f8a2c3;
            text-decoration: none;
            font-weight: bold;
        }
        #fpass{
            border: none;
            background: 0;
        }
        .forgot-password #fpass:hover {
            text-decoration: underline;
        }
        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }
        #button {
            background-color: #fbeee0;
            border: 2px solid #422800;
            border-radius: 30px;
            box-shadow: #422800 4px 4px 0 0;
            color: #422800;
            cursor: pointer;
            padding: 10px 20px;
            font-size: 15px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
        }
        button:active {
            box-shadow: #422800 2px 2px 0 0;
            transform: translate(2px, 2px);
        }
        .signup-link {
            font-size: 14px;
            color: #422800;
        }
        .signup-link a {
            color: #f8a2c3;
            text-decoration: none;
            font-weight: bold;
        }
        .signup-link a:hover {
            text-decoration: underline;
        }

.back-button {
    position: absolute;
    top: 15px;
    left: 15px;
    color: #422800;
    font-size: 16px;
    font-weight: bold;
    text-decoration: none;
    display: flex;
    align-items: center;
}

.back-button #fas fa-arrow-left {
    margin-right: 5px;
    font-size: 18px;
}

.back-button:hover {
    text-decoration: underline;
}



</style>