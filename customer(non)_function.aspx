<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer(non)_function.aspx.cs" Inherits="Register" %>

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
                            <a id="logo" class="navbar-brand" href="index.aspx" >南訓車隊預約系統</a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav navbar-right nav-tabs-vertical  <%--nav-stacked nav-justified--%>">
                                <li><a href="#" data-toggle="modal" data-target="#driver-position">查詢司機位置</a></li>
                                <%--<li><a href="#" data-toggle="modal" data-target="#modifly-order">修改訂車</a></li>--%>
                                <li><a href="customer(non)_cancel-order.aspx" >取消訂車</a></li>
                                <%--<li><a href="index.aspx">登出帳號</a></li>--%>
                                <li><a href="#contact">聯絡我們</a></li>
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
            
           <%-- <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 " >
                <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#driver-position">查詢司機位置</a>
                <br /><br />
                </div>
            </div>--%>

           <%-- <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" href="customer(non)_modifly-order.aspx">修改訂車</a>
                <br /><br />
                </div>
            </div>--%>
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" href="customer(non)_cancel-order.aspx">取消訂車</a>
                <br /><br />
                </div>
            </div>
               <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a class="btn btn-primary btn-lg" href="index.aspx">回首頁</a>
                <br /><br />
                </div>
            </div>


            <%--<div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 ">
                <a href="index.aspx" class="btn btn-primary btn-lg">登出帳號</a>
                <br /><br />
                </div>
            </div>--%>
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
        </div>
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
            
        <div class="modal" id="driver-position">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--要注意關閉功能的提示字data-dissmiss要把dissmiss改為dismiss才有功能-->
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3>查詢司機位置</h3>
                    </div>
                    <div class="modal-body">
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

                        <%--<asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem>約定時間</asp:ListItem>
                            <asp:ListItem>搭車地點</asp:ListItem>
                            <asp:ListItem>乘車人數</asp:ListItem>
                           
                        </asp:RadioButtonList>--%>
                    </div>
                    <div class="modal-footer">
                        <input id="Submit-modifly-order" type="submit" value="確定修改訂車" class="btn btn-success" />
                        <button class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
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
                            
                      
                    </div>
                    <div class="modal-footer">
                        <%--<input id="Submit-cancel-order" type="submit" value="取消訂車" class="btn btn-success" data-toggle="modal" data-target="customer(non)_cancel-order" />--%>
                        <%--<button class="btn btn-success" type="submit" data-toggle="modal" data-target="#confirm-cancel-order">取消訂車</button>--%>
                        
                        <a id="Submit-cancel-order" type="submit" <%--value="取消訂車"--%> class="btn btn-success" data-toggle="modal" href="customer(non)_cancel-order">取消訂車</a>
                        <button class="btn btn-default" data-dismiss="modal" >返回</button>
                    </div>
                </div>
            </div>
        </div>

         <%--<div class="modal" id="confirm-cancel-order">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3>您確定取消訂車???</h3>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">--%>
                        <%--<input id="Submit-confirm-cancel-order" type="submit" value="確定取消訂車" class="btn btn-success" data-toggle="modal" />--%>
                        <%--<button class="btn btn-success" type="submit" value="確定取消訂車" data-toggle="modal" data-target="customer.aspx">確定取消訂車</button>
                        <button class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </div>
            </div>
        </div>--%>

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
