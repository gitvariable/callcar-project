using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //Session.Add("user", txtTel.Text);
        //Response.Redirect("ProfilesV1.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        

        Conn.Open();
        SqlCommand objCmd = new SqlCommand("select * from Customer where C_cellphone=@phone and C_password=@pwd", Conn);
        ////objCmd.Parameters["@phone"].Value = txtTel.Text;
        ////objCmd.Parameters["@pwd"].Value = txtPassword.Text;
        objCmd.Parameters.AddWithValue("@phone", txtTel.Text);
        objCmd.Parameters.AddWithValue("@pwd", txtPassword.Text);

        SqlDataReader rd;
        rd = objCmd.ExecuteReader();



        //if (rd.Read())
         if (rd.HasRows)
         {

            //Response.Write("有這個人");
            Session.Add("user", txtTel.Text);
            Session["Login"] = "OK";

            rd.Read();

            Session["c_phone"] = rd[0].ToString();
            Session["c_password"] = rd[1].ToString();
            Session["c_name"] = rd[2].ToString();

            Response.Write("<script>alert('登入成功'); location.href='customer_function.aspx';</script>");
            //Response.Write("<script>alert('登入成功'); location.href='ProfilesV1.aspx';</script>");
            //Response.Redirect("ProfilesV1Msg.aspx");
        }
        else
        {
            Response.Write("<script>alert('帳號密碼錯誤，請重新輸入')</script>");
        }

        Conn.Close();
    }
}