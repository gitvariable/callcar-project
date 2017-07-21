﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// WebService2 的摘要描述
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
// [System.Web.Script.Services.ScriptService]
public class WebService2 : System.Web.Services.WebService
{

    public WebService2()
    {

        //如果使用設計的元件，請取消註解下列一行
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public DataSet SNQuery()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["homework6ConnectionString"].ConnectionString);
        SqlDataAdapter objCmd = new SqlDataAdapter("select ProductID,ProductName, cast(ProductPrice as int) as ProductPrice,ProductIntro,ProductImg from Products", conn);
        DataSet ds = new DataSet();
        objCmd.Fill(ds, "Products");

        return ds;

    }

}
