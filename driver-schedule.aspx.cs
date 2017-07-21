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
        string dp = "";
        if (Session["driver"] != null && Application[Session["driver"].ToString()] != null)
            dp = Application[Session["driver"].ToString()].ToString();
        else
            dp = "高雄夢時代";
        if (Session["driver"] == null)
            Response.Redirect("driverlogin.aspx");
        //Response.Write("<script>alert('"+dp+"');</script>");
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

    protected void btnExit_Click(object sender, EventArgs e)
    {
        string driverSite = Session["driver"].ToString();
        //Session.Clear();
        if (Application[driverSite] != null)
            Application[driverSite] = null;

        Response.Redirect("driver-function.aspx");
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

    protected void btnLeave_Click(object sender, EventArgs e)
    {
        string driverSite = Session["driver"].ToString();
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        SqlCommand objCmd = new SqlCommand("update DriverPosition set D_position='' where DriverId=@did", Conn);
        
        objCmd.Parameters.AddWithValue("did", driverSite);
        Conn.Open();
        objCmd.ExecuteNonQuery();
        Conn.Close();

        Response.Redirect("driver-function.aspx");
    }
}