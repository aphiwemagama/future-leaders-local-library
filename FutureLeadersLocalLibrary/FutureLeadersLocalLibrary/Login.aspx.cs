using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace FutureLeadersLocalLibrary
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void Signin_Member(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnection"].ConnectionString);
            connection.Open();

            string login = "SELECT count(*) FROM membership WHERE email='"+txtEmail.Text+"' AND password='"+txtPassword.Text+"'";
            SqlCommand command = new SqlCommand(login, connection);
            String result = command.ExecuteScalar().ToString();

            if(result == "1")
            {
                Session["memberLogin"] = txtEmail.Text;
                Response.Redirect("Library.aspx");  
            }
            else
            {
                lblLoginErrorNotification.Text = "<div class='alert alert-danger' role='alert'>Email or Password provided is incorrect</div>";
            }
        }
    }
}