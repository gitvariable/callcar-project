<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer_function.aspx.cs" Inherits="Register" %>

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
            $('#dPosition').load("driverPosition.aspx");

            //$('#CCancel').load("CustomerCancel.aspx");
            $('.form-group').addClass('col-lg-offset-4 col-lg-4 col-md-offset-4 col-md-4 col-sm-offset-4 col-sm-4');
        });
    </script>
</head>
<body>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
        InsertCommand="insert into [Order](Ordernumber,C_cellphone,Passengers,Vehicles,Starting,Dispatchtime) values(@orderno,@phone,@people,@cars,@from,@distribute)" 
        SelectCommand="select count(*) from [Order]">
        <InsertParameters>
            <%--<asp:ControlParameter ControlID="OrderNo" Name="orderno" Type="String" />--%>
            <asp:ControlParameter ControlID="txtTel" Name="phone" Type="String" />
            <asp:ControlParameter ControlID="txtPeople" Name="people" Type="String" />
            <asp:ControlParameter ControlID="txtCars" Name="cars" Type="String" />
            <asp:ControlParameter ControlID="txtFrom" Name="from" Type="String" />
            <asp:ControlParameter ControlID="txtAppointment" Name="distribute" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <form id="form1" runat="server">
        <header class="header navbar-static-top">
            <div class="container">
                <div class="text-muted">
                    <nav class="navbar navbar-default navbar-fixed-top" style="background-color: #1ba1e2; /*opacity: 0.5*/">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <!--可用&equiv;替代-->
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a id="logo" class="navbar-brand" <%--href="Index.aspx"--%> >南訓車隊預約系統</a>
                            
                        </div>
                        <%--<div class="nav navbar-nav navbar-right nav-tabs-vertical">
                            <a href="#" data-toggle="modal" data-target="#notice" class="btn-lg "><span class="glyphicon glyphicon-bell" aria-hidden="true"></span><pre class="badge" style="color:#ff0000">8</pre></a>
                        </div>--%>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav navbar-right nav-tabs-vertical  <%--nav-stacked nav-justified--%>">
                                <li><a href="#" data-toggle="modal" data-target="#notice-customer" class="btn-lg "><span class="glyphicon glyphicon-bell" aria-hidden="true"></span><pre class="badge" style="color:#ff0000"><%--通知訊息的""數量""的程式碼請寫在這裡--%></pre></a></li>
                                <li><a href="#" data-toggle="modal" data-target="#add-order">新增訂車</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#driver-position">查詢司機位置</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#modifly-order">修改訂車</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#cancel-order">取消訂車</a></li>
                                <%--<li><a href="#" data-toggle="modal" data-target="#travel-record-list">乘車紀錄查詢</a></li>--%>
                                <li>
                                    <%--<a href="index.aspx">登出帳號</a>--%>
                                    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click">登出帳號</asp:LinkButton>
                                </li>
                                <%--<li><a href="#contact">聯絡我們</a></li>--%>
                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp</li>
                            </ul>

                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <div id="home" class="container">
            <br /><br /><br /><br />
            <div class="col-xs-12 <%--jumbotron--%> text-center">
                <span class="h2">搭車功能選擇</span>
            </div><br /><br /><hr />
        <%--<div class="well">
            <div class="col-xs-12 jumbotron text-center">
                <span class="h2">搭車功能選擇</span>
                
            </div>--%>
            <%--<br />
            <br />
            <br />
            <br />
            <br />--%>
            <%--<div class="row">
                    <div class="form-group">
                        <label for="OrderNo">訂單編號</label>
                        <asp:TextBox ID="OrderNo" runat="server" MaxLength="5"></asp:TextBox>
                    </div>
                </div>--%>
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 " >
                <a class="btn btn-primary btn-lg " data-toggle="modal" data-target="#notice-customer">通知訊息<span class="badge" style="color:#ff0000 "><%--通知訊息的""數量""的程式碼請寫在這裡--%>
                    
                  <%--  <asp:UpdatePanel ID="UPNews" runat="server" style="width:20px;display:inline;">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="TimerNews" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:Label ID="TipNews" runat="server" Text="" CssClass="badge" Visible="false"></asp:Label>
                            <asp:Timer ID="TimerNews" runat="server" Interval="5000" OnTick="TimerNews_Tick"></asp:Timer>
                        </ContentTemplate>
                    </asp:UpdatePanel>--%>
                    
                    </span></a>
                    
                    <br /><br />
                </div>
            </div>

            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 " >
                <%--<a href="order.aspx" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#add-order">新增訂車</a>--%>
                    <a href="customer_order.aspx" class="btn btn-primary btn-lg">新增訂車</a>
                <br /><br />
                </div>
            </div>

            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 " >
                <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#driver-position">查詢司機位置</a>
                <br /><br />
                </div>
            </div>

            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modifly-order">修改訂車</a>
                <br /><br />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#cancel-order">取消訂車</a>
                <br /><br />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" href="customer_modifly-profiles.aspx">修改帳號資料</a>
                <br /><br />
                </div>
            </div>

            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#travel-record-list">乘車紀錄查詢</a>
                <br /><br />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a href="index.aspx" class="btn btn-primary btn-lg">登出帳號</a>
                <br /><br />
                </div>
            </div>
         </div>
            <%--<div <%--class="row">
                <div class="form-group">
                    <label for="txtTel" >行動電話</label>
                    <asp:TextBox ID="txtTel" runat="server" placeholder="請輸入您的電話號碼"></asp:TextBox>
                </div>
            </div>--%>
            <%-- %><div <%--class="row">
                <div class="form-group">
                    <label for="txtPeople">人數</label>
                    <asp:TextBox ID="txtPeople" runat="server" TextMode="Number" placeholder="請輸入搭車人數"></asp:TextBox>
                </div>
            </div>--%>
            <%--<div class="row">
                <div class="form-group">
                    <label for="txtCars">車輛數</label>
                    <asp:TextBox ID="txtCars" runat="server" TextMode="Number" placeholder="請輸入需要幾輛車"></asp:TextBox>
                </div>
            </div>--%>
            <%--<div class="row">
                <div class="form-group">
                    <label for="txtFrom">搭車地點</label>
                    <asp:TextBox ID="txtFrom" runat="server" placeholder="請輸入搭車地點"></asp:TextBox>
                </div>
            </div>--%>
            <%--<div class="row">
                <div class="form-group">
                    <label for="txtAppointment">搭車時間</label>
                    <asp:TextBox ID="txtAppointment" runat="server" TextMode="DateTimeLocal" placeholder="請輸入搭車時間"></asp:TextBox>
                    <br /><br />
                </div>--%>
        
            <%--<div <%--class="row">
                <div class="form-group">
                    <asp:LinkButton ID="btnOrder" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnOrder_Click">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;送出
                    </asp:LinkButton>
                </div>--%>
                <%-- %><div class="row">
                    <div class="form-group">
                        <a href="Index.aspx" class="btn btn-danger btn-lg">
                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;回到首頁                        
                        </a>
                    </div>
                </div>--%>
                <br />
                <br />
        <div class="modal" id="notice-customer">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3>訊息通知</h3>
                    </div>
                    <div class="modal-body">
                        <%--<asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>--%>
                         <iframe src="customer_message.aspx" style="width: 100%; height: 100%"></iframe>
                    </div>
                    <div class="modal-footer">
                       <%-- <input id="Submit-notice" type="submit" value="確定" class="btn btn-success" />--%>
                        <button class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="add-order">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3><a href="customer_order.aspx" class="btn btn-primary btn-lg">新增訂車</a></h3>
                    </div>
                    <div class="modal-body">
                       
                    </div>
                    <%--<div class="modal-footer">
                        <input id="Submit-add-order" type="submit" value="確定修改訂車" class="btn btn-success" />
                        <button class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>--%>
                </div>
            </div>
        </div>
        
        <div class="modal" id="driver-position">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--要注意關閉功能的提示字data-dissmiss要把dissmiss改為dismiss才有功能-->
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3>查詢司機位置</h3>
                    </div>
                    <div class="modal-body">
                        <%--<asp:Label ID="lblDriverPosition" runat="server" Text="司機位置"></asp:Label>--%>
                        <div id="dPosition">

                        </div>
                        <%--<div class="form-group">
                            <label for="email">Email:</label>
                            <input id="email" type="text" class="form-control" placeholder="test@abc.com" />
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input id="password" type="text" class="form-control" />
                        </div>--%>
                    </div>
                    <%--<div class="modal-footer">
                        <input id="Submit1" type="submit" value="Login" class="btn btn-success" />
                        <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>--%>

                </div>
            </div>
        </div>
        <div class="modal" id="modifly-order">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3>修改訂車</h3>
                    </div>
                    <div class="modal-body">
                         <iframe src="customer_edit_order.aspx" style="width:100%;height:100%"></iframe>
                    </div>
                    <%--<div class="modal-footer">
                        <input id="Submit-modifly-order" type="submit" value="確定修改訂車" class="btn btn-success" />
                        <button class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>--%>
                </div>
            </div>
        </div>

        <div class="modal" id="cancel-order">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3>取消訂車</h3>
                    </div>
                    <div class="modal-body">
                        <iframe src="customer_cancel.aspx" style="width:100%;height:100%"></iframe>
                        <%--<div id="CCancel">

                        </div>--%>
                    </div>
                    <div class="modal-footer">
                        <input id="Submit-cancel-order" type="submit" value="確定取消訂車" class="btn btn-success" />
                        <button class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="travel-record-list">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3>乘車紀錄查詢</h3>
                    </div>
                    <div class="modal-body">
                       <iframe src="RecordQuery.aspx" style="width:100%;height:100%"></iframe>

                    </div>
                    <div class="modal-footer">
                        <a id="Submit-travel-record" type="submit" <%--value="乘車紀錄查詢"--%> class="btn btn-success" href="customer_travel-record-result.aspx">乘車紀錄顯示</a>
                        <button class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-row">
            <footer class="navbar navbar-fixed-bottom">

                <div style="line-height: 32px; color: white; text-align: center; background-color: #1ba1e2;">
                    <span><strong><span style="font-size: 16px;">南訓車隊</span></strong><br />
                        <span style="font-size: 16px; letter-spacing: 1px"><strong>服務電話：</strong>0973-212-338&nbsp;&nbsp;&nbsp;<strong><br />
                            信箱：</strong> </span></span>
                    <span style="font-size: 16px; letter-spacing: 1px"><a href="mailto:hjbhb@gmail.com"><span style="color: white">solid9889@gmail.com</span></a></span>
                </div>
                <%--<span class="text-muted">Place sticky footer content here.</span>--%>
            </footer>
        </div>
    </form>
    <script>        
        $('input[type="text"]').addClass('form-control');
        $('input[type="number"]').addClass('form-control');
        $('input[type="datetime-local"]').addClass('form-control');
        //startAddr();
    </script>
</body>
</html>
