using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration; 

public partial class _teacher_Booking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string date = dateText.Text;
        string time = dpTime.SelectedValue;
        string room = dpRoom.SelectedValue;

        string[] splitDateStr = date.Split(new char[] { '-', '/' });

        DateTime theDate = new DateTime(Convert.ToInt32(splitDateStr[2]), Convert.ToInt32(splitDateStr[1]), Convert.ToInt32(splitDateStr[0]));

        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(dbstring);

        string sqlStr = "INSERT INTO bookings (room, bookedby, date, time) VALUES (@theRoom, @theUser, @theDate, @theTime)";

        con.Open();

        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

        sqlCmd.Parameters.AddWithValue("@theRoom", room);
        sqlCmd.Parameters.AddWithValue("@theUser", this.User.Identity.Name);
        sqlCmd.Parameters.AddWithValue("@theDate", theDate);
        sqlCmd.Parameters.AddWithValue("@theTime", time);

        sqlCmd.ExecuteNonQuery();

        con.Close();

        resultLabel.Text = "Booking added";
    }
}