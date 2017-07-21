using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

public partial class order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //txtTel.Text = "";
        //string tel;

        if (Session["user"] != null)
            txtTel.Text = Session["user"].ToString();
        //else if (Session["user"] == null)
        //    txtTel.Text = "";

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
        SqlCommand checkId = new SqlCommand("select count(*) from Customer where C_cellphone=@phone",Conn);
        
        SqlDataReader rd;

        Conn.Open();
        
        rd = objCmd.ExecuteReader();
        if (rd.Read())
        {
            int oid = Convert.ToInt32(rd[0]);
            stroid += string.Format("{0,1:D4}", oid + 1);
            //Response.Write("<script>alert('"+stroid+"')</script>");
        }
        rd.Close();
        checkId.Parameters.AddWithValue("phone", txtTel.Text);
        rd = checkId.ExecuteReader();
        if (rd.Read())
        {
            if (Convert.ToInt16(rd[0]) != 0){
                SqlDataSource1.InsertCommand = "insert into [Order](Ordernumber,C_cellphone,Passengers,Vehicles,Starting,Dispatchtime) values(@orderno,@phone,@people,@cars,@from,@distribute)";
            }
        }

        Conn.Close();
        SqlDataSource1.InsertParameters.Add("orderno", stroid);
        SqlDataSource1.Insert();
        //Response.Write("<script>alert('預約成功'); location.href='ProfilesV1Msg.aspx';</script>");

        

        Response.Redirect("customer(non)_function.aspx");

    }

    protected void txtAppointment_TextChanged(object sender, EventArgs e)
    {
        //DateTime dt = new DateTime();
        //dt = DateTime.Now;
        //if (Convert.ToDateTime(txtAppointment.Text) < DateTime.Now)
        //{
        //    Response.Write("<script>alert('請輸入正確的搭車時間')");
        //}
    }
}