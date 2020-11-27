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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void Register_Member(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnection"].ConnectionString);
            connection.Open();

            string membership = "INSERT INTO membership(Firstname, Lastname, Address, Email,Password) VALUES(@firstname, @lastname, @address, @email, @password)";

            SqlCommand command = new SqlCommand(membership, connection);
            command.Parameters.AddWithValue("@firstname", txtFirstname.Text);
            command.Parameters.AddWithValue("@lastname", txtLastname.Text);
            command.Parameters.AddWithValue("@address", txtAddress.Text);
            command.Parameters.AddWithValue("@email", txtEmail.Text);
            command.Parameters.AddWithValue("@password", txtPassword.Text);
            
            int result = command.ExecuteNonQuery();

            if (result == 1)
            {
                lblRegistrationErrorNotification.Text = "<div class='alert alert-success' role='alert'>Registration succesful. You may continue to login</div>";
            }
            else
            {
                lblRegistrationErrorNotification.Text = "<div class='alert alert-danger' role='alert'>An error occured. Please contact 0121238080 for assistance</div>";
            }

            connection.Close();
        }
    }
}