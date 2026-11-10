<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="CAKEBYTE_POS.Customer.signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>  <!--EYE ICON-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <a href="index.aspx" class="back-button">
                <i class="fas fa-arrow-left"></i> Back
            </a>
            <a href="index.aspx" class="logo-container">
                <img src="[img]/logo.png" alt="Logo" />
            </a>
            <h2 style="text-align: center;">Register</h2>

            <div class="progress-bar">
                <div class="progress" id="progress"></div>
            </div>

            <!-- Step 1 -->
            <div class="form-step active" id="step1">
                <div class="form-group">
                    <label>First Name</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator 
                        ID="rfvFirstName" 
                        runat="server" 
                        ControlToValidate="txtFirstName"
                        ErrorMessage="First name is required." 
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="Step1" />
                </div>

                <div class="form-group">
                    <label>Last Name</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator 
                        ID="rfvLastName" 
                        runat="server" 
                        ControlToValidate="txtLastName"
                        ErrorMessage="Last name is required." 
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="Step1" />
                </div>

                <div class="form-group">
                    <label>Gender (Optional)</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select" Value="" />
                        <asp:ListItem Text="Male" Value="male" />
                        <asp:ListItem Text="Female" Value="female" />
                        <asp:ListItem Text="Other" Value="other" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator 
                        ID="rfvPhone" 
                        runat="server" 
                        ControlToValidate="txtPhoneNumber"
                        ErrorMessage="Phone number is required." 
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="Step1" />
                </div>

                <div class="next-container">
                    <asp:Button 
                        ID="btnNext" 
                        runat="server" 
                        Text="Next" 
                        OnClientClick="if (!Page_ClientValidate('Step1')) return false; nextStep(); return false;" 
                        CssClass="btn" 
                        ValidationGroup="Step1" />
                </div>
            </div>

            <!-- Step 2 -->
            <div class="form-step" id="step2">
                <!-- Email -->
                <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator 
                        ID="rfvEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required." 
                        ForeColor="Red"
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator 
                        ID="revEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail"
                        ErrorMessage="Please enter a valid email address."
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ForeColor="Red"
                        Display="Dynamic" />
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label>Password</label>
                    <div style="position: relative;">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                        <i class="fas fa-eye-slash toggle-password"
                           onclick="togglePassword('txtPassword')"
                           style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
                    </div>
                    <asp:RequiredFieldValidator 
                        ID="rfvPassword" 
                        runat="server" 
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required." 
                        ForeColor="Red"
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator 
                        ID="revPasswordStrength" 
                        runat="server" 
                        ControlToValidate="txtPassword"
                        ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$" 
                        ErrorMessage="Password must be at least 8 characters, include one uppercase letter, one number, and one special character."
                        ForeColor="Red"
                        Display="Dynamic" />
                </div>

                <!-- Confirm Password -->
                <div class="form-group">
                    <label>Confirm Password</label>
                    <div style="position: relative;">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                        <i class="fas fa-eye-slash toggle-password"
                           onclick="togglePassword('txtConfirmPassword')"
                           style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
                    </div>
                    <asp:RequiredFieldValidator 
                        ID="rfvConfirmPassword" 
                        runat="server" 
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Please confirm your password." 
                        ForeColor="Red"
                        Display="Dynamic" />
                    <asp:CompareValidator 
                        ID="cvPasswordsMatch" 
                        runat="server" 
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtPassword"
                        ErrorMessage="Passwords do not match." 
                        Operator="Equal"
                        Type="String"
                        Display="Dynamic"
                        ForeColor="Red" />
                </div>

                <!-- Buttons -->
                <div class="button-container">
                    <button type="button" onclick="prevStep()">Back</button>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>

            <div class="login-container">
                <p>Already have an account? <a href="login.aspx">Login</a></p>
            </div>
        </div>

        <!-- JS Scripts -->
        <script>
            function nextStep() {
                document.getElementById('step1').classList.remove('active');
                document.getElementById('step2').classList.add('active');
                document.getElementById('progress').style.width = '100%';
            }

            function prevStep() {
                document.getElementById('step2').classList.remove('active');
                document.getElementById('step1').classList.add('active');
                document.getElementById('progress').style.width = '50%';
            }

            function togglePassword(id) {
                var field = document.getElementById(id);
                var icon = field.nextElementSibling;
                if (field.type === "password") {
                    field.type = "text";
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye");
                } else {
                    field.type = "password";
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                }
            }
        </script>
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
            position: relative;
            width: 400px;
            background: white;
            padding: 30px;
            border-radius: 30px;
            border: 2px solid #422800;
            box-shadow: #422800 4px 4px 0 0;
            padding-top: 50px; /* Space for the logo */
            margin-top: 100px;
        }
        .logo-container {
            position: absolute;
            top: -60px; 
            left: 50%;
            transform: translateX(-50%);
            width: 130px;
            height: 130px;
            background: white;
            border: 2px solid #422800;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: #422800 2px 2px 0 0;
        }
        .logo-container img {
             margin-left: 0px;
            margin-top: 0px;
            width: 115%;
            height: 115%;
        }
        .progress-bar {
            width: 100%;
            height: 8px;
            background: #f8c8dc;
            margin-bottom: 20px;
            border: 2px solid #422800;
            border-radius: 30px;
        }
        .progress {
            height: 8px;
            background: #f8a2c3;
            width: 50%;
            transition: width 0.5s ease-in-out;
            border: 1px solid #422800;
            border-radius: 30px;
        }
        .form-step {
            display: none;
        }
        .form-step.active {
            display: block;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin: 10px 0;
            text-align: left;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        button {
            background-color: #fbeee0;
            border: 2px solid #422800;
            border-radius: 30px;
            box-shadow: #422800 4px 4px 0 0;
            color: #422800;
            cursor: pointer;
            padding: 10px 20px;
            font-size: 15px;
            font-weight: bold;
        }
        button:hover {
            color: #d6336c;
            background-color: #fff;
        }
        button:active {
            box-shadow: #422800 2px 2px 0 0;
            transform: translate(2px, 2px);
        }
        .next-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }
        .login-container {
            margin-top: 20px;
            text-align: center;
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


.btn {
    width:20%;
    text-align:center;
    background-color: #fbeee0;
    border: 2px solid #422800;
    border-radius: 30px;
    box-shadow: #422800 4px 4px 0 0;
    color: #422800;
    cursor: pointer;
    padding: 10px 20px;
    font-size: 15px;
    font-weight: bold;
}
.btn:hover {
    color: #d6336c;
    background-color: #fff;
}
.btn:active {
    box-shadow: #422800 2px 2px 0 0;
    transform: translate(2px, 2px);
}


* {
    cursor: pointer;
}















    </style>