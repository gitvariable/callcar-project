using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class driverPosition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["user"] = "0972268278";
    }

    protected void GViewDP_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblDP.Text = "車輛尚未確認";
        //GridViewRow row = GViewDP.SelectedRow;
        //string orderno = row.Cells[0].Text;
        //if (Application[orderno] != null)
        //{
        //    lblDP.Text=Application[orderno].ToString();
        //}
        //else
        //{
        //    lblDP.Text="車輛尚未確認";
        //}
    }

    protected void GViewDP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //string MyJS;

        //if (((Button)e.Row.Cells[4].Controls[0]).CommandName == "DriverSite")
        //{
        //    MyJS = "alert('" + e.Row.Cells[0].Text + "')";
        //    ((Button)e.Row.Cells[4].Controls[0]).Attributes["onclick"] = MyJS;
        //}

        string orderno = e.Row.Cells[0].Text;
        string dsite = "";
        if (Application[orderno] != null)
        {
            dsite = Application[orderno].ToString();
            //Application[orderno] = null;
        }
        
        string MyJS;
        if (e.Row.RowIndex != -1)
        {
            MyJS = "if(!confirm('司機位置:【" + dsite + "】')) return;";
            //MyJS = "location.href='01map.aspx;'";
            if (((Button)e.Row.Cells[4].Controls[0]).CommandName == "DriverSite")
                ((Button)e.Row.Cells[4].Controls[0]).Attributes["onclick"] = MyJS;
        }

        //string MyJS;
        //if (e.Row.RowIndex != -1)
        //{
        //    MyJS = "if(!confirm('你確定刪除【" + e.Row.Cells[0].Text + "】的資料嗎？')) return;";
        //    if (((Button)e.Row.Cells[4].Controls[0]).CommandName == "DriverSite")
        //        ((Button)e.Row.Cells[4].Controls[0]).Attributes["onclick"] = MyJS;
        //}
    }
}