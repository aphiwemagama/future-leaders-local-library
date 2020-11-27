using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FutureLeadersLocalLibrary
{
    public partial class Resource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["memberLogin"] == null)
            {
                Response.Redirect("Redirect.aspx");
            }
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnection"].ConnectionString);
            connection.Open();

            string param = Request.QueryString["resourceID"];
            int resourceID = Convert.ToInt32(Convert.ToDouble(param));

            string displayResources = "SELECT * FROM resource WHERE Id LIKE " + resourceID;
            SqlCommand command = new SqlCommand(displayResources, connection);
            command.ExecuteNonQuery();

            DataTable dataTable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            dataAdapter.Fill(dataTable);
            tblRepeater.DataSource = dataTable;
            tblRepeater.DataBind();
        }
        protected void Issue_Resource(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnection"].ConnectionString);
            connection.Open();

            string resourceIDParam = Request.QueryString["resourceID"];
            int resourceID = Convert.ToInt32(Convert.ToDouble(resourceIDParam));
            string sessionID = Request.QueryString["sessionID"];

            string issueResource = "INSERT INTO issue(ResourceId, MembershipEmail) VALUES(@resourceid, @sessionid)";

            SqlCommand command = new SqlCommand(issueResource, connection);
            command.Parameters.AddWithValue("@resourceid", resourceID);
            command.Parameters.AddWithValue("@sessionid", sessionID);

            int result = command.ExecuteNonQuery();

            if (result == 1)
            {
                lblIssueResourceNotification.Text = "<div class='alert alert-success' role='alert'>Resource issued successfully</div>";
            }
            else
            {
                lblIssueResourceNotification.Text = "<div class='alert alert-danger' role='alert'>An error occured, try again</div>";
            }
        }
    }
}