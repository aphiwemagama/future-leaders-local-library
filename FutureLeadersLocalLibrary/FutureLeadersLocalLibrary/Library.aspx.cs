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
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["memberLogin"] == null)
            {
                Response.Redirect("Redirect.aspx");
            }

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnection"].ConnectionString);
            connection.Open();

            string displayResources = "SELECT * FROM resource";
            SqlCommand command = new SqlCommand(displayResources, connection);
            command.ExecuteNonQuery();

            DataTable dataTable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            dataAdapter.Fill(dataTable);
            tblRepeater.DataSource = dataTable;
            tblRepeater.DataBind();

            string sessionIdentity = "SELECT * FROM membership";
            SqlCommand commandSessionIdentity = new SqlCommand(sessionIdentity, connection);
            commandSessionIdentity.ExecuteNonQuery();

        }
        protected void Add_Item(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnection"].ConnectionString);
            connection.Open();

            string path = "";

            fuArtwork.SaveAs(Request.PhysicalApplicationPath+"/artwork/"+fuArtwork.FileName.ToString());
            path = "/artwork/"+fuArtwork.FileName.ToString();

            string resource = "INSERT INTO resource(Title, Author, Edition, Publisher, Artwork, ISBN) VALUES(@title, @author, @edition, @publisher, @artwork, @isbn)";

            SqlCommand command = new SqlCommand(resource, connection);
            command.Parameters.AddWithValue("@title", txtTitle.Text);
            command.Parameters.AddWithValue("@author", txtAuthor.Text);
            command.Parameters.AddWithValue("@edition", txtEdition.Text);
            command.Parameters.AddWithValue("@publisher", txtPublisher.Text);
            command.Parameters.AddWithValue("@artwork", path.ToString());
            command.Parameters.AddWithValue("@isbn", txtISBN.Text);

            String result = command.ExecuteNonQuery().ToString();

            if (result == "1")
            {
                lblAddResErrorNotification.Text = "<div class='alert alert-success' role='alert'>Resource added successfully</div>";
            }

            connection.Close();
        }
    }
}