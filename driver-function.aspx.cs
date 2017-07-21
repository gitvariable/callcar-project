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
    //string driverSite = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["driver"] == null)
            Response.Redirect("driverlogin.aspx");
        //else
        //    Response.Write("<script>alert('"+Session["driver"].ToString()+"')</script>");
    }

    //protected void btnLogin_Click(object sender, EventArgs e)
    //{
    //    SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);


    //    Conn.Open();
    //    SqlCommand objCmd = new SqlCommand("select * from Customer where C_cellphone=@phone and C_password=@pwd", Conn);
    //    //objCmd.Parameters["@phone"].Value = txtTel.Text;
    //    //objCmd.Parameters["@pwd"].Value = txtPassword.Text;
    //    objCmd.Parameters.AddWithValue("@phone", txtTel.Text);
    //    objCmd.Parameters.AddWithValue("@pwd", txtPassword.Text);

    //    SqlDataReader rd;
    //    rd = objCmd.ExecuteReader();



    //    if (rd.Read())
    //    {
    //        //Response.Write("有這個人");
    //        Session.Add("user", txtTel.Text);
    //        Response.Redirect("ProfilesV1.aspx");
    //    }
    //    else
    //    {
    //        Response.Write("<script>alert('帳號密碼錯誤，請重新輸入')</script>");
    //    }

    //    Conn.Close();
    //}

    protected void btnSchedule_Click(object sender, EventArgs e)
    {
        string driverSite="D00001";
        if (Session["driver"]!=null)
            driverSite = Session["driver"].ToString();
        Application.Add(driverSite, txtAddr.Text);
                
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        SqlCommand objCmd = new SqlCommand("update DriverPosition set D_position=@dp where DriverId=@did",Conn);
        objCmd.Parameters.AddWithValue("dp", txtAddr.Text);
        objCmd.Parameters.AddWithValue("did", driverSite);
        Conn.Open();
        objCmd.ExecuteNonQuery();
        Conn.Close();

        Response.Redirect("driver-schedule.aspx");
    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("driverlogin.aspx");
    }

    protected void TimerNews_Tick(object sender, EventArgs e)
    {
        if (Application["information"] != null)
        {
            TipNews.Visible = true;
            TipNews.Text = "N";            
        }
        else
        {
            TipNews.Visible = false;
            TipNews.Text = "";
        }
            
    }
}