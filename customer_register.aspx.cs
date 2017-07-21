using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //btnSend.Attributes["onclick"] = "alert('送出註冊訊息')";
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        //string erc="";
        if (lblTelAgain.Text == "此行動電話已被註冊")
        {
            Response.Write("<script>alert('請確認行動電話')</script>");
        }
        else
        {

            //註冊日期自動新增為今天註冊的日期
            SqlDataSource1.InsertParameters.Add("rdate", DateTime.Now.ToString("yyyy-MM-dd"));
            SqlDataSource1.Insert();
            Response.Write("<script>alert('註冊成功'); location.href='index.aspx';</script>");
        }
        
        //Response.Redirect("Index.aspx");

        //SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        //SqlCommand cmd = new SqlCommand("addValid", Conn);
        //cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("phone", txtTel.Text);
        //cmd.Parameters.AddWithValue("mail", txtEmail.Text);
        //cmd.Parameters.AddWithValue("name", txtName.Text);
        //cmd.Parameters.AddWithValue("id", txtID.Text);
        //cmd.Parameters.AddWithValue("birth", txtBirth.Text);
        //cmd.Parameters.AddWithValue("addr", txtAddr.Text);
        //SqlParameter reValParam = cmd.Parameters.Add("@Erc", SqlDbType.VarChar, 250);
        //reValParam.Direction = ParameterDirection.ReturnValue;
        //try
        //{
        //    Conn.Open();
        //    cmd.ExecuteNonQuery();
        //    erc = reValParam.Value.ToString();           
        //}
        //catch(Exception ex)
        //{
        //    string erMsg = ex.Message;
        //    Response.Write("<script>alert('註冊失敗，原因:'"+erMsg+"'，請確認資料')</script>");
        //}
        //finally
        //{
        //    Conn.Close();
        //    if (erc.Trim() == "0")
        //    {
        //        Response.Write("<script>alert('註冊OK')</script>");
        //        Session.Add("NewUser", txtName.Text);
        //        Response.Redirect("Index.aspx");
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('註冊失敗，請確認資料')</script>");
        //    }
        //}

        //Conn.Open();
        //cmd.ExecuteNonQuery();
        //erc = reValParam.Value.ToString();
        //Conn.Close();

        
    }

    protected void txtTel_TextChanged(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);

        Conn.Open();
        SqlCommand objCmd = new SqlCommand("select count(*) from Customer where C_cellphone=@phone", Conn);
        ////objCmd.Parameters["@phone"].Value = txtTel.Text;
        ////objCmd.Parameters["@pwd"].Value = txtPassword.Text;
        objCmd.Parameters.AddWithValue("@phone", txtTel.Text);

        SqlDataReader rd;
        rd = objCmd.ExecuteReader();
        rd.Read();
        if (rd[0].ToString() == "1")
        {
            lblTelAgain.Text = "此行動電話已被註冊";
            lblTelAgain.Attributes["class"] = "label label-danger";
        }
        else
        {
            lblTelAgain.Text = "此行動電話尚未被註冊";
            lblTelAgain.Attributes["class"] = "label label-success";
        }


        //if (rd.Read())
        //{
        //    //lblTelAgain.Text = "此行動電話已被註冊";
            
        //}
        //else
        //{
        //    lblTelAgain.Text = "此行動電話尚未被註冊";
        //}

        Conn.Close();
    }
}