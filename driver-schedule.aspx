<%@ Page Language="C#" AutoEventWireup="true" CodeFile="driver-schedule.aspx.cs" Inherits="Login" %>

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
    <style>
        #startC{
            display:none;
        }
        #btnExit{
            width:100%;
        }
    </style>
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

                </button>

                <a id="logo" class="navbar-brand" href="Index.aspx">南訓車隊預約系統</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right nav-tabs-vertical ">
                        <li><a href="#<%--function--%>" data-toggle="tab">回功能選項</a></li>
                        <li><a href="#<%--complete--%>">載客記錄</a></li>
                        <li><a href="#<%--member--%>" data-toggle="tab">司機資訊</a></li>
                        <li><a href="#<%--contact--%>">聯絡車隊&nbsp&nbsp</a></li>
                    </ul>
                </div>
            </nav>
            <%--</div>--%>
        </div>
        <%--</header>--%>
        <div id="home" class="container">
            <br /><br /><br /><br />
            <div class="col-xs-12 <%--jumbotron--%> text-center">
                <span class="h2">司機排班系統</span>
            </div><br /><hr />
        <%--    <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a id="startC" class="btn btn-primary btn-lg">開始排班載客</a>
                    <asp:TextBox ID="txtAddr" runat="server"></asp:TextBox>
                <br /><br />
                </div>
            </div>--%>


            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#driverOrder">檢視目前載客</a>
                    <div class="modal" id="driverOrder">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button class="close" data-dismiss="modal">&times;</button>
                                    <h3>目前訂單</h3>
                                </div>
                                <div class="modal-body">
                                    <iframe src="driverOrder.aspx" style="width: 100%; height: 100%"></iframe>
                                    <%--<div id="CCancel">

                        </div>--%>
                                </div>
                                <div class="modal-footer">
                                    <%--<input id="Submit-cancel-order" type="submit" value="確定" class="btn btn-success" />--%>
                                    <button class="btn btn-default" data-dismiss="modal">返回</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <br /><br />
                </div>
            </div>

            <%--<div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg">車隊最新訊息</a>
                <br /><br />
                </div>
            </div>--%>

              <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a href="driver_eventreport2.aspx" class="btn btn-primary btn-lg">
                    <span class="glyphicon glyphicon-arrow-up"></span>
                    事件回報
                </a>
                <br /><br />
                </div>
            </div>



            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#broadcast">
                    <span class="glyphicon glyphicon-facetime-video"></span>
                    <%--群組會議--%>
                    車隊廣播&nbsp;
                    
                    <asp:UpdatePanel ID="UPNews" runat="server" style="width:20px;display:inline;">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="TimerNews" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:Label ID="TipNews" runat="server" Text="" CssClass="badge" Visible="false"></asp:Label>
                            <asp:Timer ID="TimerNews" runat="server" OnTick="TimerNews_Tick" Interval="5000"></asp:Timer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </a>

                    <div class="modal" id="broadcast">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button class="close" data-dismiss="modal">&times;</button>
                                    <h3>最新訊息</h3>
                                </div>
                                <div class="modal-body">
                                    <iframe src="driverNews.aspx" style="width: 100%; height: 100%"></iframe>
                                    <%--<asp:TextBox ID="txtNews" ReadOnly="true" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>--%>
                                </div>
                                <div class="modal-footer">
                                    <%--<input id="Submit-cancel-order" type="submit" value="確定" class="btn btn-success" />--%>
                                    <button class="btn btn-default" data-dismiss="modal">返回</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    

                <br /><br />
                </div>
            </div>










            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <%--<a class="btn btn-primary btn-lg">離開車隊排班</a>--%>
                    <asp:LinkButton ID="btnLeave" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnLeave_Click">
                        <span class="glyphicon glyphicon-log-out"></span>
                        離開車隊排班
                    </asp:LinkButton>

                <br /><br />
                </div>
            </div>
            </div>

            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <asp:LinkButton ID="btnExit" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnExit_Click" Visible="false">
                        <span class="glyphicon glyphicon-log-out"></span>
                        登&nbsp;&nbsp;&nbsp;&nbsp;出
                    </asp:LinkButton>
                <br /><br />
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
