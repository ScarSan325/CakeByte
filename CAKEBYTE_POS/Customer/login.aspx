<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="CAKEBYTE_POS.Customer.login" %>

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
    <div class="container">
        <a href="index.aspx" class="back-button">
            <i class="fas fa-arrow-left"></i>
        </a>

        <div class="logo">
            <a href="index.aspx">
                <img src="[img]/logo.png" alt="Logo" />
            </a>
        </div>

        <h2 style="margin-top: 40px;">Customer Login</h2>

        <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            <!-- Use ASP.NET Label for error -->
            <asp:Label ID="emailError" runat="server" ForeColor="Red" CssClass="error-message"></asp:Label>
        </div>

        <div class="form-group password-container">
            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <i class="fas fa-eye-slash toggle-password" onclick="togglePassword()"></i>
            <!-- Use ASP.NET Label for error -->
            <asp:Label ID="passwordError" runat="server" ForeColor="Red" CssClass="error-message"></asp:Label>
        </div>

        <p class="forgot-password"><a href="forgot-password.aspx">Forgot Password?</a></p>

        <div class="button-container">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClientClick="return validateForm();" OnClick="btnLogin_Click" />

            <p class="signup-link">Don't have an account? <a href="signup.aspx">Sign up</a></p>
        </div>
    </div>
</form>

<script>
    function togglePassword() {
        const passwordField = document.getElementById('<%= txtPassword.ClientID %>');
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

    function validateForm() {
        let isValid = true;
        const email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
        const password = document.getElementById('<%= txtPassword.ClientID %>').value.trim();
        const emailError = document.getElementById("<%= emailError.ClientID %>");
        const passwordError = document.getElementById("<%= passwordError.ClientID %>");

        emailError.textContent = "";
        passwordError.textContent = "";

        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailPattern.test(email)) {
            emailError.textContent = "Enter a valid email address.";
            isValid = false;
        }

        // Validate password
        if (password.length < 6) { // minimum 6 characters
            passwordError.textContent = "Password must be at least 8 characters long.";
            isValid = false;
        }

        return isValid; // If false, ASP.NET will NOT submit the form
    }
</script>






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
        input {
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

.password-container input {
    padding-right: 2%; /* give space for the eye */
}

.toggle-password {
    position: absolute;
    right: 10px;
    top: 65%;
    transform: translateY(-50%); /* center vertically */
    cursor: pointer;
    color: #422800;
    font-size: 16px;
}



.forgot-password {
    font-size: 14px;
    color: #422800;
    text-align: left;
    margin-top: 5px;
    width: 100%;
}

.forgot-password a {
    color: #f8a2c3;
    text-decoration: none;
    font-weight: bold;
}

.forgot-password a:hover {
    text-decoration: underline;
}

.button-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
}

* {
    cursor: pointer;
}


        #btnLogin {
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
        #btnLogin:active {
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

.back-button i {
    margin-right: 5px;
    font-size: 18px;
}

.back-button:hover {
    text-decoration: underline;
}
.error-message {
    font-size: 12px;
    color: red;
    margin-top: 5px;
    display: block;
}



    </style>