*<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="CAKEBYTE_POS.Customer.about" %>

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


        </form>

    <div class="main-box">
  <div class="prof-container">
    <div class="sidebars">
      <h2>My Account</h2>

      <button class = "opt" onclick="showTab('profile')">Edit Profile</button>
<button class = "opt" onclick="showTab('change-password')">Change Password</button>

    </div>
    <div class="content">
      <div class="header">
        <h2>My Profile</h2>
        <div class="user-info">
          <img id="current-profile-img" src="" alt="Current Profile">
          <span id="current-name">Scarlette Sanoy</span>
        </div>
      </div>

      <div id="profile" class="tab-content">
        <div class="profile-container">
          <div class="profile-box">
            <p>Manage and protect your account</p>
            <label>Username</label>
            <input type="text" class="input-box" id="username" value="ud15zjewf6">
            <label>Name</label>
            <input type="text" class="input-box" id="name" value="Scarlette Sanoy">
            <label>Email</label>
            <input type="text" class="input-box" id="email" value="s***@gmail.com">
            <label>Phone Number</label>
            <input type="text" class="input-box" id="phone" value="*********31">
            <label>Date of Birth</label>
            <input type="text" class="input-box" id="dob" value="**/**/2002">
            <label>Gender:</label>
            <div style="margin-bottom: 10px;">
              <input type="radio" name="gender" value="Male" checked> Male
              <input type="radio" name="gender" value="Female"> Female
              <input type="radio" name="gender" value="Other"> Other
            </div>
            <label>Address</label>
            <input type="text" class="input-box" id="address" placeholder="Enter your address here..." />
            <button class="save-btn" onclick="updateProfile()">Save</button>
          </div>

          <div class="image-container">
            <div class="image-box">
              <img id="profile-img" src="" alt="Profile Image">
              <input type="file" id="image-upload" onchange="changeProfileImage()">
              <p>File size: maximum 1 MB</p>
              <p>File extension: .JPEG, .PNG</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Change Password Tab -->
      <div id="change-password" class="tab-content hidden">
        <div class="profile-container">
          <div class="profile-box">
            <label>Current Password</label>
            <input type="password" class="input-box" id="current-pass"><br>
            <label>New Password</label>
            <input type="password" class="input-box" id="new-pass"> 
            <label>Confirm New Password</label>
            <input type="password" class="input-box" id="confirm-pass">
            <button class="save-btn" onclick="changePassword()">Change Password</button>
          </div>
        </div>
      </div>


    </div>
  </div>
</div>

<script>
    function updateProfile() {
        const name = document.getElementById("name").value;
        document.getElementById("current-name").textContent = name;
        alert("Profile updated!");
    }

    function changeProfileImage() {
        const file = document.getElementById("image-upload").files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById("profile-img").src = e.target.result;
                document.getElementById("current-profile-img").src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }

    function showTab(tabId) {
        document.querySelectorAll(".tab-content").forEach(tab => {
            tab.classList.add("hidden");
        });
        document.getElementById(tabId).classList.remove("hidden");
    }

    function changePassword() {
        const current = document.getElementById("current-pass").value;
        const newPass = document.getElementById("new-pass").value;
        const confirm = document.getElementById("confirm-pass").value;

        if (!current || !newPass || !confirm) {
            alert("All fields are required.");
            return;
        }

        if (newPass !== confirm) {
            alert("New passwords do not match.");
            return;
        }

        alert("Password changed successfully!");
    }
</script>



</body>
</html>
<style>
    * {
    cursor: pointer;
}
    body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    background: #f9f9f9;
}

.prof-container {
    display: flex;
    width: 100%;
}



.sidebars {
    width: 20%;
    background: #FFB6C1; /*  f8a2c3   */
    display: flex;
    flex-direction: column;
    padding: 25px;
}


.opt {
    font-size: 22px;
    padding: 10px;
    width: 100%;
    margin-top: 10px;
    padding: 10px;
    background: #FFB6C1;
    color: black;
    border: none;
    cursor: pointer;
}

    .opt:hover {
        background: #D6336C;
        color: white;
        border-radius: 5px;
    }



.content {
    flex: 1;
    padding: 20px;
}

.heads {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    background: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-bottom: 2px solid #ddd;
    border: 2px black solid;
    border-radius: 5px;
}

    .header .user-info {
        display: flex;
        align-items: center;
    }

        .header .user-info img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
            border: 2px solid #ddd;
        }

.profile-container {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    background: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border: 2px solid black;
    background-color: White;
    gap: 40px;
}

.profile-box {
    flex: 1;
}



.image-container {
    width: 220px;
    text-align: center;
    border-left: 2px solid #aaa; /* Darker, cleaner line */
    padding-left: 20px;
    margin-left: 20px; /* Adds spacing from input section */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.image-box img {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    background: #ddd;
    border: 3px solid #555;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    object-fit: cover;
    margin-bottom: 10px;
}


.image-box input[type="file"] {
    margin-top: 10px;
    padding: 5px;
    width: 100%;
}





.input-box {
    width: 100%;
    padding: 8px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.save-btn {
    background: #D6336C;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
}

    .save-btn:hover {
        background: #b02a58;
    }

.hidden {
    display: none;
}

.main-box {

    max-width: 90%;
    margin: 40px auto;
    margin-top:8%;


    background-color: #fff;
    border-radius: 30px;
    box-shadow: #422800 4px 4px 0 0;
    border: 2px solid #422800;
    padding: 0px 30px 0px 0;
    overflow: hidden;
    display: flex;
    min-height: 700px;
}



#change-password .profile-box label {
    padding: 0px;
}

#change-password .input-box {
    width: 91%;
    padding: 10px;
    margin-bottom: 10px; 
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px; 
}


#profile-img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 50%;
    border: 3px solid #555;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}


#current-profile-img {
    width: 50px;
    height: 50px;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid #ddd;
}

#profile-img, #current-profile-img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 50%;
    border: 3px solid #555;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

#current-profile-img {
    width: 50px;
    height: 50px;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid #ddd;
}


</style>

