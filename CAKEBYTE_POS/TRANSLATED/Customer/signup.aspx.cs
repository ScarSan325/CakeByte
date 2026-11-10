using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text.RegularExpressions;

namespace CAKEBYTE_POS.Customer
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_load(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
                new ScriptResourceDefinition{
                    Path = "https://code/jquery.com/jquery-3.6.0min.js"
            });
        }

        private void DisplayAlert(string message)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string firstname = fname.Text.Trim();
            string lastname = lname.Text.Trim();
            string phonenum = pn.Text.Trim();


            if (string.IsNullOrEmpty(firstname) || string.IsNullOrEmpty(lastname) || string.IsNullOrEmpty(phonenum))
            {
                DisplayAlert("Please fill in all fields.");
                return;
            }
            else
            {
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Basic server-side validation
            if (string.IsNullOrWhiteSpace(txtFirstName.Text) ||
                string.IsNullOrWhiteSpace(txtLastName.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmPassword.Text))
            {
                lblError.Text = "Please fill in all required fields.";
                return;
            }

            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblError.Text = "Passwords do not match.";
                return;
            }

            // If valid, store in Session
            Session["FirstName"] = txtFirstName.Text;
            Session["LastName"] = txtLastName.Text;
            Session["Gender"] = ddlGender.SelectedValue;
            Session["Phone"] = txtPhone.Text;
            Session["Email"] = txtEmail.Text;
            Session["Password"] = txtPassword.Text; // Note: For real apps, NEVER store passwords like this.

            // Redirect or proceed to login/dashboard
            Response.Redirect("Welcome.aspx");
        }




    }
}