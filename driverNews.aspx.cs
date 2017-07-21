using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class driverNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void TimerNews_Tick(object sender, EventArgs e)
    {
        if (Application["information"] != null)
            txtNews.Text = Application["information"].ToString();
        else
            txtNews.Text = "";
    }
}