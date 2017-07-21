using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//要先寫上
using System.Web.Configuration;
using System.Data.SqlClient;
//


public partial class ManagerLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection Conn = new SqlConnection( WebConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        Conn.Open(); //連結資料庫

        SqlDataReader dr = null;

        SqlCommand objCmd = new SqlCommand("select * from Manager where [M_account]= @M_account and [M_password]=@M_password", Conn);
        objCmd.Parameters.AddWithValue("@M_account", TextBox1.Text);
        objCmd.Parameters.AddWithValue("@M_password", TextBox2.Text);

        //執行SQL指令，取出資料做驗證
        dr = objCmd.ExecuteReader();
        //兩個寫法都可以
        //dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        // CommandBehavior.CloseConnection需要搭配 System.Data命名空間。

        if (!dr.HasRows)//假如帳號密碼錯誤
        {
           Response.Write("<h2>帳號或是密碼有錯,請回上一頁重新輸入</h2>");
            //關閉DataReader之前,一定要先取消SqlCommand
           Response.End();  //終止程式  
            //如果錯誤，也可以設計回到前頁重新開始
            //Response.Redirect("managerlogin.aspx");
        }
        else
         {
            //利用Session，避免同一台使用者想用同一個瀏覽器登入其他帳號
            //同一台電腦、桌面，使用多個瀏覽器，連上Web Server 之後  每個Session都是獨一無二的
            //不會重覆、不共用
            Session["Login"] = "OK";
            // 帳號密碼驗證成功，才能獲得這個 Session("Login") = "OK" 鑰匙
            //--------------
            dr.Read();  //必須使用.Read()方法才能讀取資料表的欄位
            //----------------

            Session["m_name"] = dr[0].ToString();
            Session["m_password"] = dr[1].ToString();
            //讀取的資料表欄位順序從0開始
            Response.Redirect("managerindex.aspx");
            //驗證成功,導向另一個網頁



           

        }

    }
}