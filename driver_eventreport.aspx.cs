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
    //protected void Page_Load(object sender, EventArgs e)
    //{

    //}

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
    //protected void Page_Load(object sender, EventArgs e)
    //{

    //}

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
    protected void btnGo_Click(object sender, EventArgs e)
    {
        //Application["center"] += Session["driver"].ToString() + ":乘客已上車";
        if (Session["driver"] != null)
            Application["center"] += Session["driver"].ToString() + ":乘客已上車\r\n";
        else
            Response.Redirect("driverlogin.aspx");
        Response.Write("<script>alert('訊息已回傳')</script>");
    }

    //protected void btnArrive_Click(object sender, EventArgs e)
    //{        
    //    Application["center"] += Session["driver"].ToString() + ":乘客已下車\r\n";

    //    //乘車記錄
    //    //string driverno = "";
    //    //string msgNo = "";
    //    //if (Session["driver"] != null)
    //    //    driverno = Session["driver"].ToString();
    //    //msgNo = driverno.Replace("D", "M");




    //    Response.Write("<script>alert('訊息已回傳')</script>");
    //}

    protected void btnEnding_Click(object sender, EventArgs e)
    {
        string driverno = "";
        string msgNo = "";
        string carId = "";
        if (Session["driver"] != null)
            driverno = Session["driver"].ToString();
        msgNo = driverno.Replace("D", "M");
        string orderno = Application[msgNo].ToString();


        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);

        SqlCommand readData = new SqlCommand("select top 1 * from car where driverid=@did", Conn);
        SqlCommand insRiderecord = new SqlCommand("insert into [riderecord](ordernumber,vehicleid,ending,startingtime,endingtime,mileage,discount,fare,event,evaluation) values(@ordernumber,@vehicleid,@ending,@startingtime,@endingtime,@mileage,@discount,@fare,@event,@evaluation)", Conn);

        SqlDataReader rd;

        Conn.Open();

        readData.Parameters.AddWithValue("did", driverno);
        rd = readData.ExecuteReader();
        if (rd.Read())
        {
            carId = rd[0].ToString();
        }
        rd.Close();

        insRiderecord.Parameters.AddWithValue("ordernumber", orderno);
        insRiderecord.Parameters.AddWithValue("vehicleid", carId);
        insRiderecord.Parameters.AddWithValue("ending", txtEnding.Text);
        insRiderecord.Parameters.AddWithValue("startingtime", "2017/06/25");
        insRiderecord.Parameters.AddWithValue("endingtime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
        insRiderecord.Parameters.AddWithValue("mileage", "0");
        insRiderecord.Parameters.AddWithValue("discount", "0");
        insRiderecord.Parameters.AddWithValue("fare", "0");
        insRiderecord.Parameters.AddWithValue("event", "");
        insRiderecord.Parameters.AddWithValue("evaluation", "");
        insRiderecord.ExecuteNonQuery();
        //int rowcnt = insRiderecord.ExecuteNonQuery();


        Conn.Close();

        Application["center"] += Session["driver"].ToString() + ":乘客已下車\r\n";
        Response.Write("<script>alert('訊息已回傳')</script>");

    }

    protected void btnLost_Click(object sender, EventArgs e)
    {
        if (Session["driver"] != null)
            Application["center"] += Session["driver"].ToString() + ":乘客未在預定地點等待。\r\n";
        else
            Response.Redirect("driverlogin.aspx");
        Response.Write("<script>alert('訊息已回傳')</script>");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Session["driver"] != null)
            Application["center"] += Session["driver"].ToString() + ":因故暫時無法載客。\r\n";
        else
            Response.Redirect("driverlogin.aspx");
        Response.Write("<script>alert('訊息已回傳')</script>");
    }

    protected void GoBackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("driver-function.aspx");
    }
}