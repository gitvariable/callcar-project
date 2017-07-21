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
        
    }
}