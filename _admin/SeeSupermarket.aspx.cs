using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration; 

public partial class _admin_ManageSupermarket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void CheckManager()
    {
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(dbstring);

        string sqlStr = "SELECT manager from supermarket";

        con.Open();
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
        sqlCmd.ExecuteNonQuery();
        con.Close();

        if(){
            string sqlStr2 = "Update supermarket set manager=@theNull where manager=@theManager";
            sqlCmd.Parameters.AddWithValue("@theManager", txtName.Text);
            sqlCmd.Parameters.AddWithValue("@theNull", DBNull.Value);

            con.Open();
            sqlCmd = new SqlCommand(sqlStr2, con);
            sqlCmd.ExecuteNonQuery();
            con.Close();      
        }


    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList DropdownManager = (DropDownList)ManagerList.EditItem.FindControl("ManagerDropDownListInsert");
        TextBox ManagerTextBox = (TextBox)ManagerList.EditItem.FindControl("ManagerFKTextBoxEdit");

        ManagerTextBox.Text = DropdownManager.SelectedValue;
    }
}