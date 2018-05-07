using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Compare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSourceID = "SQLDataSource1";
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(TextBox1.Text))
        {
            GridView1.DataSourceID = "SQLDataSource1";
        }
        else
        {
            GridView1.DataSourceID = "SQLDataSource2";
        }
    }
}