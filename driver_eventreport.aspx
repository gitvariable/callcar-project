<%@ Page Language="C#" AutoEventWireup="true" CodeFile="driver_eventreport.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <link href="NMRStyle.css" rel="stylesheet" />
    <link href="Content/NMRStyle.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('.form-group').addClass('col-lg-offset-4 col-lg-4 col-md-offset-4 col-md-4 col-sm-offset-4 col-sm-4');            
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <%-- <header class="header navbar-fixed-top">--%>
        <div class="container">
            <%--<div class="text-muted" >--%>
            <nav class="navbar navbar-default navbar-fixed-top" style="background-color: #1ba1e2/*#403b3b*/; /*opacity: 0.5*/">
                <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <!--可用&equiv;替代-->
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a id="logo" class="navbar-brand" href="index.aspx">南訓車隊預約系統</a>
                
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right nav-tabs-vertical ">
                        <li><a href="driver_function.aspx">回功能選項</a></li>
                        <li><a href="driver_travel-record.aspx">載客記錄</a></li>
                        <li><a href="#">司機資訊</a></li>
                        <li><a href="#">聯絡車隊</a></li>
                        <%--<li><a href="driverlogin.aspx">登出帳號</a></li>--%>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>
            </nav>
            <%--</div>--%>
        </div>
        <%--</header>--%>
        <div id="home" class="container">
            <br /><br /><br /><br />
            <div class="col-xs-12 <%--jumbotron--%> text-center">
                <span class="h2">司機事件回報</span>
            </div><br /><hr />
            
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <%--<a class="btn btn-primary btn-lg" href="driver_current-order.aspx" //data-toggle="modal" data-target="#travel-to-destination"//>載客出發回報</a>--%>

                    <asp:LinkButton ID="btnGo" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnGo_Click">載客出發回報</asp:LinkButton>
                <br /><br />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#travel-arrive-destination">載客到達回報</a>
                    <%--<asp:LinkButton ID="btnArrive" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnArrive_Click">載客到達回報</asp:LinkButton>--%>
                <br /><br />
                </div>
            </div>

            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <%--<a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#travel-lost">載客遺失回報</a>--%>

                    <asp:LinkButton ID="btnLost" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnLost_Click">載客遺失回報</asp:LinkButton>
                <br /><br />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <%--<a class="btn btn-primary btn-lg" >臨時取消載客</a>--%>

                    <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnCancel_Click">臨時取消載客</asp:LinkButton>
                <br /><br />
                </div>
            </div>

              <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <%--<a class="btn btn-primary btn-lg" >臨時取消載客</a>--%>

                    <asp:LinkButton ID="GoBackButton" runat="server" CssClass="btn btn-primary btn-lg" OnClick="GoBackButton_Click">回上一頁</asp:LinkButton>
                <br /><br />
                </div>
            </div>




            </div>


       <%-- <div class="form-group col-lg-6">
                    <label for="txtTel">帳號</label>
                    <asp:TextBox ID="txtTel" runat="server" Text="0972268278"></asp:TextBox>
                </div>                
                <div class="form-group col-lg-6">
                    <label for="txtPassword">密碼</label>
                    <asp:TextBox ID="txtPassword" runat="server" Text="lwm1574@gmail.com"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnLogin_Click">
                        <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> &nbsp;&nbsp;登入
                    </asp:LinkButton>--%>
                    <!--2 Button之間間隔-->
                    <%--<span class="col-md-offset-12 col-sm-offset-12 col-xs-offset-12"></span>--%>
                    
                
                <%--<div class="form-group">
                    <a href="Index.aspx" class="btn btn-danger btn-lg">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span> &nbsp;&nbsp;回到首頁
                    </a>
                </div>--%>
    
        
        <div class="modal" id="travel-arrive-destination">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3>載客到達回報</h3>
                    </div>
                    <div class="modal-body">
                        <%--這裡要放置，訂單的資訊及該次交易的時間地點、金額的程式碼--%>
                        <label for="txtEnding" class="label label-success">下車地點</label>
                        <asp:TextBox ID="txtEnding" runat="server" CssClass="form-control" placeholder="輸入乘客下車地點"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnEnding" runat="server" Text="確認" CssClass="btn btn-success btn-lg" OnClick="btnEnding_Click" />
                        <%--<input id="Submit-travel-arrive-destination" type="submit" value="確定" class="btn btn-success btn-lg" />--%>
                        <%--<button class="btn btn-default btn-lg" data-dismiss="modal">返回</button>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="travel-lost">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3>載客遺失回報</h3>
                    </div>
                    <div class="modal-body">
                        乘客未出現搭車，回報車隊。
                    </div>
                    <div class="modal-footer">
                        <a id="Submit-travel-to-destination" type="submit" <%--value="確定"--%> class="btn btn-success btn-lg" href="driver_schedule.aspx">確定</a>
                        <%--<button class="btn btn-default btn-lg" data-dismiss="modal">返回</button>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-row">
            <footer class="footer navbar-fixed-bottom">
                <div style="line-height: 32px; color: white; text-align: center; background-color: #1ba1e2;">
                    <span><strong><span style="font-size: 16px;">南訓車隊</span></strong><br />
                        <span style="font-size: 16px; letter-spacing: 1px"><strong>服務電話：</strong>0973-212-338&nbsp;&nbsp;&nbsp;<strong><br />信箱：</strong> </span></span>
                    <span style="font-size: 16px; letter-spacing: 1px"><a href="mailto:hjbhb@gmail.com"><span style="color: white">solid9889@gmail.com</span></a></span>
                </div>
            </footer>
        </div>
    </form>
    <script>
        $('input[type="text"]').addClass('form-control');
        $(':password').addClass('form-control');
        
    </script>

</body>
</html>
