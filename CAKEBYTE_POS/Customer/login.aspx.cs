using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAKEBYTE_POS.Customer
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool VerifyPassword(string enteredPassword, string storedHashedPassword)
        {
            // Assuming you are using SHA-256 for hashing (you can use a different algorithm if needed)
            string hashedEnteredPassword = HashPassword(enteredPassword);
            return storedHashedPassword.Equals(hashedEnteredPassword);
        }

        // Method to hash the password using SHA-256
        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Convert the password to a byte array and compute the hash
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert the byte array to a hex string
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Retrieve email and hashed password from session
            string storedEmail = Session["Email"] as string;
            string storedHashedPassword = Session["HashedPassword"] as string;

            if (storedEmail == null || storedHashedPassword == null)
            {
                emailError.Text = "No account found. Please sign up first."; // This should be an ASP.NET control
                return;
            }

            // Check if the email matches
            if (storedEmail.Equals(email, StringComparison.OrdinalIgnoreCase))
            {
                // Verify the password by hashing the entered password and comparing
                if (VerifyPassword(password, storedHashedPassword))
                {
                    // If login is successful, redirect to the home page
                    Session["Email"] = email;  // Store email in session to mark the user as logged in
                    Response.Redirect("c_home.aspx");
                }
                else
                {
                    passwordError.Text = "Invalid password.";  // This should be an ASP.NET control
                }
            }
            else
            {
                emailError.Text = "Email does not match."; // This should be an ASP.NET control
            }
        }

    }


}
