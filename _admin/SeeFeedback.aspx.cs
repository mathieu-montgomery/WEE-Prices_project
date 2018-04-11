using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration; 

public partial class _admin_SeeFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void selected(object sender, EventArgs e)
    {
        /* Take the value of the selected item's primary key (in this case the croom value) and
        * store it as a session variable with the name "conference". In this way we can see
        * which room the user selected on all pages. 
        * Then redirect to the page bookconferenceroom.aspx to complete the booking.
        */
        string str = ListView1.SelectedDataKey.Value.ToString();
        txtInfo.Text = str;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        // Creates a connection to our database
        SqlConnection con = new SqlConnection(dbstring);

        // The SQL statement to insert a booking. By using prepared statements,
        // we automatically get some protection against SQL injection.
        string sqlStr = "DELETE FROM feedback WHERE id=@theId";

        // Open the database connection
        con.Open();
        //sstring str = ListView1L
        // Create an executable SQL command containing our SQL statement and the database connection
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
        sqlCmd.Parameters.AddWithValue("@theID", 1);

        // Execute the SQL command
        sqlCmd.ExecuteNonQuery();

        // Close the connection to the database
        con.Close();

        // Show the user that the booking has been added
        txtInfo.Text = "Feedback deleted";

    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}