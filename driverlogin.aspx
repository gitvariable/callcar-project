<%@ Page Language="C#" AutoEventWireup="true" CodeFile="driverlogin.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/NMRStyle.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('.form-group').addClass('col-lg-offset-4 col-lg-4 col-md-offset-4 col-md-4 col-sm-offset-4 col-sm-4');            
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header navbar-fixed-top">
      <div class="container" >
        <div class="text-muted" >
            <nav class="navbar navbar-default navbar-fixed-top" style="background-color:#1ba1e2/*#403b3b*/; /*opacity:0.5*/">
                <div class="navbar-header" >
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <!--可用&equiv;替代-->
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a id="logo" class="navbar-brand" href="driverlogin.aspx">南訓車隊預約系統</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right nav-tabs-vertical  <%--nav-stacked nav-justified--%>">
                        <li><a href="#member" data-toggle="tab">會員資料</a></li>
                        <li><a href="#order" data-toggle="tab">訂單資料</a></li>
                        <li><a href="#complete">乘車記錄</a></li>
                        <li><a href="#contact">聯絡我們&nbsp;&nbsp;</a></li>
                    </ul>
                </div>
            </nav>
        </div>
      </div>
    </header>
    <div class="well">
        
            <div class="col-xs-12 jumbotron text-center">
                <span class="h3">司機登入</span>
                
            </div>


        <%--<div class="dropdown" style="float:right;">
            <button class="btn btn-default btn-lg" data-toggle="dropdown">
                &equiv;
            <span class="caret"></span>
            </button>--%>

            <%--<ul class="dropdown-menu"">
                <li><a href="#" class="dropdown-header">Action1</a></li>
                <li class="disabled"><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li><a href="#">Separated link</a></li>

                <li><a href="#" class="dropdown-header">Action2</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li><a href="#">Separated link</a></li>

                <li><a href="#" class="divider"></a></li>

                <li><a href="#">Something else here</a></li>
                <li><a href="#">Separated link</a></li>
            </ul>--%>


       <%-- </div>--%>



        <div class="form-group col-lg-6">
                    <label for="txtTel">帳號</label>
                    <asp:TextBox ID="txtTel" runat="server" Text="" placeholder="輸入司機編號"></asp:TextBox>
                </div>                
                <div class="form-group col-lg-6">
                    <label for="txtPassword">密碼</label>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="輸入密碼" TextMode="Password" Text=""></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnLogin_Click">
                        <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> &nbsp;&nbsp;登入
                    </asp:LinkButton>
                    <!--2 Button之間間隔-->
                    <%--<span class="col-md-offset-12 col-sm-offset-12 col-xs-offset-12"></span>--%>
                    
                </div>
                <%--<div class="form-group">
                    <a href="Index.aspx" class="btn btn-danger btn-lg">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span> &nbsp;&nbsp;回到首頁
                    </a>
                </div>--%>
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
