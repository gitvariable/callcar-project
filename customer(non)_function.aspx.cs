using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //int value = 1;
        //Response.Write("<script>alert('" + string.Format("{0,10:D3}",value)+"')</script>");
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        //SqlDataSource1.SelectCommand
        //SqlDataSource1.InsertParameters.Add("orderno", "AA222");
        string stroid = "k";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        SqlCommand objCmd = new SqlCommand("select count(*) from [Order]", Conn);
        SqlDataReader rd;

        Conn.Open();
        rd = objCmd.ExecuteReader();
        if (rd.Read())
        {
            int oid = Convert.ToInt32(rd[0]);
            stroid += string.Format("{0,1:D4}", oid + 1);
            //Response.Write("<script>alert('"+stroid+"')</script>");
        }
        Conn.Close();
        SqlDataSource1.InsertParameters.Add("orderno", stroid);
        SqlDataSource1.Insert();
    }
}