<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <link href="/NMRStyle.css" rel="stylesheet" />
    <link href="Content/NMRStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <header class="header navbar-fixed-top">
      <div class="container">
        <div class="text-muted" >
            <nav class="navbar navbar-default navbar-fixed-top"  style="background-color:#1ba1e2; /*opacity:0.5*/">
                <div class="navbar-header" >
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <!--可用&equiv;替代-->
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a id="logo" class="navbar-brand" href="Index.aspx">南訓車隊預約系統</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right nav-tabs-vertical">
                        <li><a href="customer(non)_orderrule.html" >快速叫車</a></li>
                        <li><a href="customer_orderrule.html" >會員登入</a></li>
                        <li><a href="customer_register.aspx">會員註冊</a></li>
                        <li><a href="#contact">聯絡我們</a></li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp</li>
                    </ul>
                </div>
            </nav>
        </div>
      </div>
    </header>
    
    <div id="home" class="container-fluid">
        <br /><br /><br />
        <div class="row" ><%--class="col-md-offset-4 col-md-4 col-sm-offset-4 col-sm-4 col-lg-offset-4 col-lg-4 "--%>
            <div style="margin:auto" class="col-lg-offset-3"<%--class="col-lg-6 col-md-6 col-sm-12 col-xs-12"--%>>
            <%--<div style="padding:0px" class=" col-md-4  col-sm-4  col-lg-4 col-xs-4 text-center" >--%>
                <%--<span class="h3">南訓車隊預約系統</span>--%>
                <div id="index-img" class="col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4"><img src="Images/taxi-driver.jpg" style="width:56%" /></div>
                <%--<div id="index-img-xlg " class="col-lg-offset-4 <%--col-md-offset-1 col-sm-offset-1 col-xs-offset-1"><img src="Images/taxi-driver.jpg" style="width:56%" /></div>--%>
                <%--<div id="index-img-xlg" class="col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4<%--col-md-offset-1 col-sm-offset-1 col-xs-offset-1 index-img"><img src="Images/taxi-driver.jpg" style="width:56%" /></div>--%>
            </div>
        </div>
         <%--<hr />--%>
        <%--<div class="row">
            <div class="col-xs-12 col-lg-12">
                <img src="Images/Lighthouse.jpg" class="" />
            </div>
        </div>--%>

        <div class="row"> <!--col-lg-offset-4 col-lg-4-->
            <%--<div class="col-lg-offset-4 col-lg-4 col-md-offset-3 col-md-5 col-sm-offset-4 col-sm-4 col-xs-offset-3 col-xs-5 ">--%>
            <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a href="customer(non)_orderrule.html" class="btn btn-primary btn-lg">
                    <span class="glyphicon glyphicon-phone" aria-hidden="true"></span> &nbsp;&nbsp;快速叫車
                </a>
                <%--<hr />--%>
                <br /><br />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6">
                <a href="customer_orderrule.html" class="btn btn-primary btn-lg">
                    <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> &nbsp;&nbsp;會員登入
                </a>
                <%--<hr />--%>
                <br /><br />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6">
                <a href="customer_registerrule.html" class="btn btn-primary btn-lg">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;會員註冊
                </a>
                <%--<hr />--%>
                <br /><br />             
            </div>
        </div>
    </div>
        <div class="footer-row">
            <footer class="navbar navbar-static-bottom ">

                <div style="line-height: 32px; color: white; text-align: center; background-color: #1ba1e2;">
                    <span>
                        <strong><span style="font-size: 16px;">南訓車隊</span></strong><br />
                        <span style="font-size: 16px; letter-spacing: 1px"><strong>服務電話：</strong>0973-212-338&nbsp;&nbsp;&nbsp;<br />
                            <strong>信箱：</strong> </span></span>
                    <span style="font-size: 16px; letter-spacing: 1px"><a href="mailto:hjbhb@gmail.com"><span style="color: white">solid9889@gmail.com</span></a></span>
                </div>
            </footer>
        </div>
    </form>
</body>
</html>
