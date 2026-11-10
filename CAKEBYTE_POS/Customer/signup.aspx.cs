using System;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace CAKEBYTE_POS.Customer
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Method to hash the password using SHA256
        public string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                // Convert password string to byte array
                byte[] passwordBytes = Encoding.UTF8.GetBytes(password);

                // Compute the hash
                byte[] hashBytes = sha256.ComputeHash(passwordBytes);

                // Convert hash bytes to a hex string
                StringBuilder sb = new StringBuilder();
                foreach (byte b in hashBytes)
                {
                    sb.Append(b.ToString("x2"));
                }

                return sb.ToString();
            }
        }

        // Method for validating email and password before submission
        

        // Method to check if email is valid
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check if form is valid
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                // Hash the password
                string hashedPassword = HashPassword(password);

                // Store email and hashed password in session (for temporary storage)
                Session["Email"] = email;
                Session["HashedPassword"] = hashedPassword;

                // Redirect to the login page after sign-up
                Response.Redirect("login.aspx");
            }
        }
    }
}
