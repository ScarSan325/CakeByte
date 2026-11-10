<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventory.aspx.cs" Inherits="CAKEBYTE_POS.Admin.inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="admin_style/nav_admin.css"/>
    <link rel="stylesheet" type="text/css" href="admin_style/invent.css"/>

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
        <div class="sidebarss">
    <button class="tab active" onclick="openTab(event, 'add')">Add Product</button>
    <button class="tab" onclick="openTab(event, 'list')">Product List</button>
    <button class="tab" onclick="openTab(event, 'update')">Update Product</button>
    <button class="tab" onclick="openTab(event, 'delete')">Delete Product</button>
</div>


        <div class="content">
            <!-- Add Product Tab -->
            <div id="add" class="tab-content active">
                <h3>Add Product</h3>
                <input type="text" id="prodID" placeholder="Product ID">
                <input type="text" id="prodName" placeholder="Product Name">
                <input type="text" id="prodDesc" placeholder="Product Description">
                <select id="prodCategory">
                    <option value="Cake">Cake</option>
                    <option value="Bread">Bread</option>
                    <option value="Cookies&Biscuits">Cookies&Biscuits</option>
                    
                    <option value="Donuts&Muffins">Donuts&Muffins</option>
                    <option value="ComboDeals">ComboDeals</option>
                </select>
                <input type="number" id="prodPrice" placeholder="Price">
                <input type="number" id="prodStock" placeholder="Quantity (Stocks)">
                <input type="file" id="prodImage" accept="image/*">
                <button onclick="addProduct()">Add Product</button>
            </div>

            <div id="update" class="tab-content">
                <h3>Update Product</h3>
                <div id="updateList"></div>
            </div>

            <div id="delete" class="tab-content">
                <h3>Delete Product</h3>
                <div id="deleteList"></div>
            </div>

            <!-- Product List Tab -->
            <div id="list" class="tab-content">
                <h3>Product List</h3>
                <div id="productList"></div>
            </div>







        </div>
    </div>

    <script>
        let products = [];

        function openTab(event, tabName) {
            document.querySelectorAll(".tab-content").forEach(tab => tab.style.display = "none");
            document.querySelectorAll(".tab").forEach(tab => tab.classList.remove("active"));

            document.getElementById(tabName).style.display = "block";
            event.currentTarget.classList.add("active");

            displayProductList();
        }


        function addProduct() {
            let id = document.getElementById("prodID").value.trim();
            let name = document.getElementById("prodName").value.trim();
            let desc = document.getElementById("prodDesc").value.trim();
            let category = document.getElementById("prodCategory").value;
            let price = document.getElementById("prodPrice").value;
            let stock = document.getElementById("prodStock").value;
            let imageInput = document.getElementById("prodImage");

            if (!id || !name || !desc || !category || !price || !stock || !imageInput.files.length) {
                alert("Please fill in all fields!");
                return;
            }

            let reader = new FileReader();
            reader.onload = function (event) {
                let imageURL = event.target.result;
                products.push({ id, name, desc, category, price, stock, imageURL }); // Fix: Add category
                displayProductList();
                clearInputs();
            };
            reader.readAsDataURL(imageInput.files[0]);
        }


        function clearInputs() {
            document.getElementById("prodID").value = "";
            document.getElementById("prodName").value = "";
            document.getElementById("prodDesc").value = "";
            document.getElementById("prodCategory").value = "";
            document.getElementById("prodPrice").value = "";
            document.getElementById("prodStock").value = "";
            document.getElementById("prodImage").value = "";
        }


        function displayProductList() {
            let productList = document.getElementById("productList");
            let updateList = document.getElementById("updateList");
            let deleteList = document.getElementById("deleteList");

            productList.innerHTML = products.map((p, index) => `
        <div class="product-card">
            <div class="product-left">
                <div class="product-image-container">
                    <img src="${p.imageURL}" class="product-image">
                </div>
                <div class="product-details">
                    <div class="product-name">${p.name}</div>
                    <div class="product-category">Category: ${p.category}</div>
                    <div class="product-description">Description: ${p.desc}</div>
                </div>
            </div>
            <div class="product-right">
                <div class="product-price">Price: $${p.price}</div>
                <div class="product-stock">Stock: ${p.stock} items</div>
            </div>
        </div>
    `).join('');

            updateList.innerHTML = products.map((p, index) => `
        <div class="product-card">
            <div class="product-left">
                <div class="product-image-container">
                    <img src="${p.imageURL}" class="product-image">
                </div>
                <div class="product-details">
                    <div class="product-name">${p.name}</div>
                    <div class="product-category">Category: ${p.category}</div>
                    <div class="product-description">Description: ${p.desc}</div>
                </div>
            </div>
            <div class="product-right">
                <div class="product-price">Price: $${p.price}</div>
                <div class="product-stock">Stock: ${p.stock} items</div>
                <div class="product-actions">
                <button onclick="showEditForm(${index})">Update</button>
            </div>
            </div>
            
        </div>
    `).join('');

            deleteList.innerHTML = products.map((p, index) => `
        <div class="product-card">
            <div class="product-left">
                <div class="product-image-container">
                    <img src="${p.imageURL}" class="product-image">
                </div>
                <div class="product-details">
                    <div class="product-name">${p.name}</div>
                    <div class="product-category">Category: ${p.category}</div>
                    <div class="product-description">Description: ${p.desc}</div>
                </div>
            </div>
            <div class="product-right">
                <div class="product-price">Price: $${p.price}</div>
                <div class="product-stock">Stock: ${p.stock} items</div>
                <div class="product-actions">
                <button onclick="deleteProduct(${index})">Delete</button>
            </div>
            </div>
            
        </div>
    `).join('');
        }






        /*        MODAL          */

        function showEditForm(index) {
            let product = products[index];

            document.getElementById("editIndex").value = index;
            document.getElementById("editName").value = product.name;
            document.getElementById("editDesc").value = product.desc;
            document.getElementById("editCategory").value = product.category;
            document.getElementById("editPrice").value = product.price;
            document.getElementById("editStock").value = product.stock;

            let modal = document.getElementById("editModal");
            modal.classList.add("show");
        }

        function closeModal() {
            let modal = document.getElementById("editModal");
            modal.classList.remove("show");
        }
        function saveEdit() {
            let index = document.getElementById("editIndex").value;
            products[index].name = document.getElementById("editName").value;
            products[index].desc = document.getElementById("editDesc").value;
            products[index].category = document.getElementById("editCategory").value;
            products[index].price = document.getElementById("editPrice").value;
            products[index].stock = document.getElementById("editStock").value;

            displayProductList();
            closeModal();
        }


        function updateProduct(index) {
            products[index].name = document.getElementById(`editName-${index}`).value;
            products[index].desc = document.getElementById(`editDesc-${index}`).value;
            products[index].price = document.getElementById(`editPrice-${index}`).value;
            products[index].stock = document.getElementById(`editStock-${index}`).value;
            displayProductList();
        }

        function deleteProduct(index) {
            if (confirm("Are you sure you want to delete this product?")) {
                products.splice(index, 1);
                displayProductList();
            }
        }

    </script>


<div id="editModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h3>Edit Product</h3>
        
        <input type="hidden" id="editIndex"/>

        <label for="editName">Product Name:</label>
        <input type="text" id="editName" placeholder="Enter product name"/>

        <label for="editDesc">Product Description:</label>
        <input type="text" id="editDesc" placeholder="Enter product description">

        <label for="editCategory">Category:</label>
        <select id="editCategory">
            <option value="Cake">Cake</option>
            <option value="Bread">Bread</option>
            <option value="Cookies&Biscuits">Cookies&Biscuits</option>
            
            <option value="Donuts&Muffins">Donuts&Muffins</option>
            <option value="ComboDeals">ComboDeals</option>
        </select>

        <label for="editPrice">Price:</label>
        <input type="number" id="editPrice" placeholder="Enter price">

        <label for="editStock">Stock:</label>
        <input type="number" id="editStock" placeholder="Enter stock quantity">

        <button onclick="saveEdit()">Save</button>
    </div>
</div>


</body>
</html>
    <script>
        document.getElementById("accountBtn").addEventListener("click", function () {
            // Clear session (Modify this if you're using authentication tokens)
            sessionStorage.clear();
            localStorage.clear();

            // Redirect to login page
            window.location.href = "a_login.aspx";
        });
    </script>


<style>

.product-card {
    display: flex;
    flex-direction: row;
    margin: 10px;
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    position: relative; /* Allow absolute positioning of buttons inside */
}

.product-left {
    margin-top:0px;
    display: flex;
    flex-direction: row;
    margin-right: 15px;
    flex-grow: 1;
}

.product-image-container {
    flex-shrink: 0;
    margin-right: 15px;
}

.product-image {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 8px;
}

.product-details {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.product-name {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 5px;
}

.product-category,
.product-description {
    font-size: 14px;
    margin-bottom: 5px;
}

.product-right {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
}

.product-price {
    font-size: 16px;
    color: #2a9d8f;
    font-weight: bold;
    margin-bottom: 5px;
}

.product-stock {
    font-size: 14px;
    color: #e76f51;
    font-weight: bold;
}

.product-actions {
    position: absolute;
    bottom: 10px; 
    right: 10px; 
    display: flex;
    gap: 20px; 
}

.product-actions button {
    margin-top:2%;
    padding: 5px 10px;
    background-color: #FFB6C1;
    color: black;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

.product-actions button:hover {
        color: white;
    background-color: #D6336C;
}

* {
    cursor: pointer;
}






















</style>