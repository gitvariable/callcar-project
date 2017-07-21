<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerMessage.aspx.cs" Inherits="managerMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>訊息檢視表</title>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/manager2.css" rel="stylesheet" />
     <style type="text/css">
         .style1
        {
            font-size: large;
            font-weight: bold;
        }
        .style2
        {
            color: #FFCCFF;
            background-color: #FF6600;
        }
    </style>


    <script>
       
    </script>



</head>
<body>
    <form id="form1" runat="server">
    <div>

       <div>
         <nav class="navbar navbar-default navbar-fixed-top"  style="background-color:#ff0000; /*opacity:0.5*/">
                <div class="navbar-header" >
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <!--可用&equiv;替代-->
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a id="logo" class="navbar-brand" href="managerindex.aspx" style="font-size:30px;">車隊後台管理介面</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right nav-tabs-vertical  <%--nav-stacked nav-justified--%>">
                     <li> <a href="managerRiderecord.aspx">乘車紀錄查詢</a></li>
                        <li> <a href="managerDwithC.aspx">媒合功能</a></li>
                        <li><a href="managerOrder.aspx" >訂單檢視表</a></li>
                        <li><a href="managerMessage.aspx" >訊息檢視表</a></li>
                        <li><a href="managerDandC.aspx" >司機檢視表</a></li>
                        <li><a href="managerCustomers.aspx">乘客檢視表</a></li>
                        <li><asp:Button ID="Buttonlogout" runat="server" Text="登出" OnClick="Button2_Click" /></li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>
            </nav>
        </div>
        <br/>
        <br/>

        <div id="message">
             訊息室&nbsp; <%--<span class="style1">AJAX</span>--%>
        <hr />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <asp:Label ID="Label_timer" runat="server"
                    Style="color: #FFFF66; background-color: #0000FF">
                </asp:Label>
                <%--&nbsp;/ 每0.5秒透過AJAX更新一次畫面--%>
                <hr />

                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Timer ID="Timer1" runat="server" Interval="500" OnTick="Timer1_Tick">
                </asp:Timer>
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
        <hr />

        訊息內容：<asp:TextBox ID="TextBox1" runat="server" Width="348px"></asp:TextBox>
        &nbsp;<asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click" />
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="TextBox1" ErrorMessage="不可以空白！" Style="text-align: center"></asp:RequiredFieldValidator>
        <br />
        <br />
        

        </div>






  
    </div>
    </form>
</body>
</html>
