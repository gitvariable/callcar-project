using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;

public partial class CustomerDriver : System.Web.UI.Page
{
    List<string> dpList = new List<string>();
    List<driverV1> d1List = new List<driverV1>();

    string positionFirst = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["m_name"] == null)
        {
            Response.Redirect("managerlogin.aspx");
        }
    }

    protected void GridViewPassenger_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewPassenger.SelectedRow;


        lblOrder.Text = row.Cells[0].Text;
        positionFirst = row.Cells[4].Text;
    }

    public string getPosition()
    {
        if (positionFirst != "")
            return positionFirst;
        else
            return "高雄夢時代";
    }

    protected void TimerDriver_Tick(object sender, EventArgs e)
    {
        driverV1 d1;
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        SqlCommand objCmd = new SqlCommand("select driverID,D_position from DriverPosition", Conn);


        SqlDataReader rd;

        Conn.Open();

        rd = objCmd.ExecuteReader();
        while (rd.Read())
        {
            if (rd[1].ToString() != "")
            {
                d1 = new driverV1() { driverId = rd[0].ToString(), driverP = rd[1].ToString() };
                d1List.Add(d1);
            }
            
        }
        rd.Close();
        Conn.Close();



        //SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        //SqlCommand objCmd = new SqlCommand("select driverID from driver", Conn);


        //SqlDataReader rd;

        //Conn.Open();

        //rd = objCmd.ExecuteReader();
        //while (rd.Read())
        //{
        //    if (Application[rd[0].ToString()] != null)
        //    {
        //        string dp = rd[0].ToString() + "在" + Application[rd[0].ToString()].ToString();
        //        dpList.Add(dp);
        //        d1 = new driverV1() { driverId = rd[0].ToString(), driverP = Application[rd[0].ToString()].ToString() };
        //        d1List.Add(d1);
        //    }
        //}
        //rd.Close();
        //Conn.Close();


        JavaScriptSerializer objSerial = new JavaScriptSerializer();

        txtDP.Text = objSerial.Serialize(d1List);

        if (Application["center"] != null)
            txtReceive.Text = Application["center"].ToString();
    }

    protected void btnMatch_Click(object sender, EventArgs e)
    {
        //string orderno = lblOrder.Text;
        //Application[orderno] = lblDPosition.Text;

        //string vid = "";
        //SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        //SqlCommand objCmd = new SqlCommand("select c.vehicleId from driver d inner join car c on d.driverId=c.driverId where d.driverId=@did", Conn);
        //objCmd.Parameters.AddWithValue("@did", lblDriver.Text);
        //SqlDataReader rd;

        //Conn.Open();
        //rd = objCmd.ExecuteReader();
        //if (rd.Read())
        //{
        //    vid = rd[0].ToString();
        //}
        //rd.Close();

        ////Response.Write(lblDriver.Text + "," + lblOrder.Text);
        //Session["res"] = lblDriver.Text + "," + lblOrder.Text;
        //Response.Redirect("testRes.aspx");

        ////SqlCommand insCmd = new SqlCommand("insert into riderecord(ordernumber,vehicleid,ending,startingtime,endingtime,mileage,fare) values(@orderno,@vid,@endAddr,@st,@endt,@mile,@fare)", Conn);
        ////insCmd.Parameters.AddWithValue("@orderno", lblOrder.Text);
        ////insCmd.Parameters.AddWithValue("@vid", vid);
        ////insCmd.Parameters.AddWithValue("@endAddr", "高雄火車站");
        ////insCmd.Parameters.AddWithValue("@st", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
        ////insCmd.Parameters.AddWithValue("@endt", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
        ////insCmd.Parameters.AddWithValue("@mile", "0");
        ////insCmd.Parameters.AddWithValue("@fare", "0");
        ////insCmd.ExecuteNonQuery();
        //Conn.Close();
        ////foreach (driverV1 dvobj in d1List) {
        ////    if (dvobj.driverId == lblDriver.Text)
        ////    {
        ////        d1List.Remove(dvobj);
        ////    }
        ////}
    }

    protected void btnAnnounce_Click(object sender, EventArgs e)
    {
        if (Application["information"] == null)
            Application["information"] = txtBroadcast.Text+"\r\n";
        else
            Application["information"] += txtBroadcast.Text+"\r\n";

        txtBroadcast.Text = "";
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        if (Application["information"] != null)
            Application["information"] = null;

        txtBroadcast.Text = "";
    }

    protected void btnMsgDelete_Click(object sender, EventArgs e)
    {
        if (Application["center"] != null)
            Application["center"] = null;

        txtReceive.Text = "";
    }

    protected void btnOn_Click(object sender, EventArgs e)
    {
        //SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        //SqlCommand objCmd = new SqlCommand("select DriverId,'                                                                                    ' as D_position into DriverPosition from driver", Conn);
        //Conn.Open();
        //objCmd.ExecuteNonQuery();
        //Conn.Close();
    }

    protected void btnOff_Click(object sender, EventArgs e)
    {
        Application.Clear();
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);

        //假如原本資料表內已經有DriverPosition了，這段SQL語法會先刪除掉這資料表，然後重新新增DriverPosition
        SqlCommand objCmd = new SqlCommand("IF (OBJECT_ID('DriverPosition')) Is Not Null Drop Table DriverPosition;select DriverId,'                                                                                    ' as D_position into DriverPosition from driver", Conn);
        Conn.Open();
        objCmd.ExecuteNonQuery();
        Conn.Close();
    }

    protected void BackButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("managerindex.aspx");
    }
}