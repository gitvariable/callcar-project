using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class managerindex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["m_name"] == null)
        {
            Response.Redirect("managerlogin.aspx");
        }
    }

    protected void Buttonlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("managerlogin.aspx");
    }
}