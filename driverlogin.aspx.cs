using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["driver"] != null)
            Response.Redirect("driver-function.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);


        Conn.Open();
        SqlCommand objCmd = new SqlCommand("select * from Driver where DriverID=@phone and D_password=@pwd", Conn);
        //objCmd.Parameters["@phone"].Value = txtTel.Text;
        //objCmd.Parameters["@pwd"].Value = txtPassword.Text;
        objCmd.Parameters.AddWithValue("@phone", txtTel.Text);
        objCmd.Parameters.AddWithValue("@pwd", txtPassword.Text);

        SqlDataReader rd;
        rd = objCmd.ExecuteReader();

        

        if (rd.Read())
        {
            //Response.Write("有這個人");
            Session.Add("driver", txtTel.Text);
            Conn.Close();
            Response.Write("<script>alert('登入成功'); location.href='driver-function.aspx';</script>");
            //Response.Redirect("driver-function.aspx");
        }
        else
        {
            Response.Write("<script>alert('帳號密碼錯誤，請重新輸入')</script>");
            Conn.Close();
        }

        //Conn.Close();
    }
}