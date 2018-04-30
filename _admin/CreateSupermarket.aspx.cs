using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration; 

public partial class _admin_CreateSupermarket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        // Creates a connection to our database
        SqlConnection con = new SqlConnection(dbstring);

        // The SQL statement to insert a booking. By using prepared statements,
        // we automatically get some protection against SQL injection.
        string sqlStr = "INSERT INTO supermarket (name, adress, manager, email, telephone) VALUES (@theName, @theAdress, @theManager, @theEmail, @theTelephone)";

        // Open the database connection
        con.Open();

        // Create an executable SQL command containing our SQL statement and the database connection
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
        
        // Fill in the parameters in our prepared SQL statement
        sqlCmd.Parameters.AddWithValue("@theName", txtName.Text);
        sqlCmd.Parameters.AddWithValue("@theAdress", txtAdress.Text);
        if(check_box_no_manager.Checked)
            sqlCmd.Parameters.AddWithValue("@theManager", DBNull.Value);
        else
            sqlCmd.Parameters.AddWithValue("@theManager", DropDownList1.SelectedValue);
        sqlCmd.Parameters.AddWithValue("@theEmail", txtEmail.Text);
        sqlCmd.Parameters.AddWithValue("@theTelephone", txtTelephon.Text);

        // Execute the SQL command
        sqlCmd.ExecuteNonQuery();

        // Close the connection to the database
        con.Close();

        // Show the user that the booking has been added
        txtInfo.Text = "Supermarket added";

        txtName.Text = "";
        txtAdress.Text = "";
        txtEmail.Text = "";
        txtTelephon.Text = "";
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("CreateSupermarketAccount.aspx");
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }
}