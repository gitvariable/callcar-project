using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Profiles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string tel = Session["user"].ToString();
        ////Response.Write(tel);
        //SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Network_Motorcade_Appointment_SystemConnectionString"].ConnectionString);
        //Conn.Open();
        //SqlCommand objCmd = new SqlCommand("select * from Customer where C_cellphone=@phone", Conn);
        //objCmd.Parameters.AddWithValue("phone", tel);
        //SqlDataReader rd;
        //rd = objCmd.ExecuteReader();
        //if (rd.Read())
        //{
        //    OrderName.Text = rd[2].ToString() + "的訂單資料";
        //}
        //Conn.Close();
    }

    

    protected void DLPersonal_EditCommand(object source, DataListCommandEventArgs e)
    {
        DLPersonal.EditItemIndex = e.Item.ItemIndex;
        DLPersonal.DataBind();
    }

    protected void DLPersonal_CancelCommand(object source, DataListCommandEventArgs e)
    {
        DLPersonal.EditItemIndex = -1;
        DLPersonal.DataBind();
    }

    protected void DLPersonal_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        TextBox name = (TextBox)e.Item.FindControl("txtName");
        TextBox id = (TextBox)e.Item.FindControl("txtID");
        TextBox addr = (TextBox)e.Item.FindControl("txtAddr");
        TextBox mail = (TextBox)e.Item.FindControl("txtMail");
        TextBox birth = (TextBox)e.Item.FindControl("txtBirth");

        SqlDataSource1.UpdateParameters["name"].DefaultValue = name.Text;
        SqlDataSource1.UpdateParameters["id"].DefaultValue = id.Text;
        SqlDataSource1.UpdateParameters["addr"].DefaultValue = addr.Text;
        SqlDataSource1.UpdateParameters["mail"].DefaultValue = mail.Text;
        SqlDataSource1.UpdateParameters["birth"].DefaultValue = birth.Text;


        SqlDataSource1.Update();
        DLPersonal.EditItemIndex = -1;
        DLPersonal.DataBind();
    }

    protected void GVOrder_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string orderno = GVOrder.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
        SqlDataSource2.UpdateParameters["orderno"].DefaultValue = orderno;
    }

    protected void GVOrder_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string CancelJS;

        if (e.Row.RowIndex != -1)
        {
            CancelJS = "if(!confirm('確定要取消" + e.Row.Cells[2].Text + "的訂單嗎?')) return;";
            if (((Button)e.Row.Cells[3].Controls[0]).CommandName == "Update")
                ((Button)e.Row.Cells[3].Controls[0]).Attributes["onclick"] = CancelJS;
        }
    }

    protected void GVOrder_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        Application.Add("D00001", Session["user"].ToString() + "取消訂單");
    }
}