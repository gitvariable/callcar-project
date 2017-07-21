using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// WebService 的摘要描述
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //如果使用設計的元件，請取消註解下列一行
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void ConfirmOrderd2(string orderno, string driverno, string positiond)
    {
        //string orderno = lblOrder.Text;
        //Application[orderno] = lblDPosition.Text;

        Application[orderno] = positiond;
        string msgNo = driverno.Replace("D", "M");
        Application[msgNo] = orderno;
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

}
