using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAKEBYTE_POS.Customer
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                // Store to session
                Session["Email"] = email;
                Session["Password"] = password;

                // Redirect or show confirmation
                Response.Redirect("login.aspx");
            }
        }


    }
}