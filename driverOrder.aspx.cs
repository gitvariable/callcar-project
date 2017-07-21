using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class driverOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string driverno = "";
        string msgNo = "";
        if (Session["driver"] != null)
            driverno = Session["driver"].ToString();
        msgNo = driverno.Replace("D", "M");
        if (Application[msgNo] != null)
            lblOrderno.Text = Application[msgNo].ToString();
    }
}