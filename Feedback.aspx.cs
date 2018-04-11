using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration; 

public partial class Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string text = txtFeedback.Text;
        // Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        // Creates a connection to our database
        SqlConnection con = new SqlConnection(dbstring);

        // The SQL statement to insert a booking. By using prepared statements,
        // we automatically get some protection against SQL injection.
        string sqlStr = "INSERT INTO feedback (username, description) VALUES (@theUser, @theDescription)";

        // Open the database connection
        con.Open();

        // Create an executable SQL command containing our SQL statement and the database connection
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

        // Fill in the parameters in our prepared SQL statement
        sqlCmd.Parameters.AddWithValue("@theUser", this.User.Identity.Name);
        sqlCmd.Parameters.AddWithValue("@theDescription", text);

        // Execute the SQL command
        sqlCmd.ExecuteNonQuery();

        // Close the connection to the database
        con.Close();

        // Show the user that the booking has been added
        result.Text = "Feedback is done!";
        txtFeedback.Text = "";

    }
    protected void TextFeedback_TextChanged(object sender, EventArgs e)
    {

    }
}