<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer(non)_order.aspx.cs" Inherits="order" %>

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

    <script src="mapV1.js"></script>
    <script>
        $(document).ready(function () {
            var today = new Date();
            $('.form-group').addClass('col-lg-offset-4 col-lg-4 col-md-offset-4 col-md-4 col-sm-offset-4 col-sm-4');
            //$('#myPosition').load('002maptestV1.html');
            //$('#txtAppointment').val(today);
            //$('#txtAppointment').focusout(function () {
            //    //alert('test');
            //    var time = Date.parse($(this).val());

            //    if (time < today)
            //        alert('請選擇正確日期');
            //    //alert(time);
            //});

            //Date.parse($('#txtAppointment').val())

            function CheckForm() {
                var time = Date.parse($('#txtAppointment').val());
                if (time < today){
                    alert('請選擇正確日期');
                    return false;
                }
                if ($('#txtFrom').val() == "" || $('#txtAppointment').val() == "") {
                    alert('必須選擇搭車地點及時間');
                    return false;
                }
                var orderInfo = "搭車地點:" + $('#txtFrom').val() + "\n搭車日期:" + $('#txtAppointment').val().toString().replace("T","\n\t時間:") + "\n確認要送出本次訂單嗎？";
                if (confirm(orderInfo) == true)

                    return true;

                else

                    return false;

            }

            $('#btnOrder').click(function () {
                return CheckForm();
            });
        });
    </script>
</head>
<body>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
        InsertCommand="insert into Customer(C_cellphone,C_password,C_name) values(@phone,@phone,@name);insert into [Order](Ordernumber,C_cellphone,Passengers,Vehicles,Starting,Dispatchtime,Ordercancel) values(@orderno,@phone,@people,@cars,@from,@distribute,'1')" 
        SelectCommand="select count(*) from [Order]">
        <InsertParameters>
            <%--<asp:ControlParameter ControlID="OrderNo" Name="orderno" Type="String" />--%>
            <asp:ControlParameter ControlID="txtName" Name="name" Type="String" />
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
                            </button>
                            <a id="logo" class="navbar-brand">南訓車隊預約系統</a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav navbar-right nav-tabs-vertical  <%--nav-stacked nav-justified--%>">
                                <li><a href="customer_modifly-Profiles.aspx">會員資料</a></li>
                                 <li><a href="customer(non)_function.aspx">快速查詢</a></li>
                                <li><a href="#contact">聯絡我們&nbsp;&nbsp;</a></li>
                               
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <div >
            <br />
            <br />
            <br />
            <br />
            <br />

    <div>
        <%--<span class="btn btn-primary" data-toggle="modal" data-target="#CarModal">車輛選擇</span>--%>
    </div>
            <%--<iframe src="orderrule.html" style="height:100%" width="500"></iframe>--%>
    <div class="modal" id="CarModal">
        <div class="modal-dialog">
            <div class="modal-content"> 
                    <div class="modal-header">
                        <span class="h3">請依需求選擇車輛條件</span>
                        <span data-dismiss="modal" style="float:right">&times;</span>
                    </div>                
                    <div class="modal-body">
                        <div>
                            <asp:CheckBoxList ID="cklistCar" CssClass="btn btn-info btn-lg" runat="server">
                                <asp:ListItem>車頂架</asp:ListItem>
                                <asp:ListItem>寵&nbsp;&nbsp;物</asp:ListItem>
                                <asp:ListItem>禁&nbsp;&nbsp;菸</asp:ListItem>
                                <asp:ListItem>包&nbsp;&nbsp;車</asp:ListItem>
                                <asp:ListItem>無障礙</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </div>
                    <div class="modal-footer">
                        
                    </div>
            </div>
        </div>
    </div>
            <%--<div class="row">
                    <div class="form-group">
                        <label for="OrderNo">訂單編號</label>
                        <asp:TextBox ID="OrderNo" runat="server" MaxLength="5"></asp:TextBox>
                    </div>
                </div>--%>

            <div <%--class="row"--%>>
                <div class="form-group">
                    <label for="txtName">乘客</label>
                    <asp:TextBox ID="txtName" runat="server" placeholder="如何稱呼您?"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtName" ForeColor="White" CssClass="label label-danger" runat="server" ErrorMessage="不可為空"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div <%--class="row"--%>>
                <div class="form-group">
                    <label for="txtTel">行動電話</label>
                    <asp:TextBox ID="txtTel" runat="server" placeholder="請輸入您的電話"></asp:TextBox>
                </div>
            </div>
            <div <%--class="row"--%>>
                <div class="form-group">
                    <label for="txtPeople">人數</label>
                    <asp:TextBox ID="txtPeople" runat="server" TextMode="Number" Text="1" placeholder="請確認人數"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtPeople" Type="Integer" MinimumValue="1" MaximumValue="8" runat="server" ErrorMessage="請輸入正確人數" ForeColor="White" CssClass="label label-danger"></asp:RangeValidator>
                </div>
            </div>
            <div <%--class="row"--%>>
                <div class="form-group">
                    <label for="txtCars">車輛數</label>
                    <asp:TextBox ID="txtCars" runat="server" TextMode="Number" Text="1" placeholder="請確認車輛數"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator2" ControlToValidate="txtCars" Type="Integer" MinimumValue="1" MaximumValue="3" runat="server" ErrorMessage="請輸入正確車輛數" ForeColor="White" CssClass="label label-danger"></asp:RangeValidator>
                </div>
            </div>
            <div <%--class="row"--%>>
                <div class="form-group">
                    <label for="txtFrom">搭車地點</label>
                    <asp:TextBox ID="txtFrom" runat="server" placeholder="請選擇搭車地點"></asp:TextBox>                    
                    <span class="btn btn-primary" data-toggle="modal" data-target="#LocationModal">選擇地點</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFrom" runat="server" ErrorMessage="地點錯誤" Display="Dynamic" ForeColor="white" CssClass="label label-danger"></asp:RequiredFieldValidator>


                    <div class="modal" id="LocationModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <span class="h3">請選擇地點</span>
                                    <span data-dismiss="modal" style="float: right" onclick="inputAddr()">&times;</span>
                                </div>
                                <div class="modal-body" style="/*border:5px solid black*/height:400px;">
                                    <%--<input id="txtPConfirm" type="text" />--%>
                                    <%--<div id="googleMap" style="width:100%;/*height:400px;*/"></div>--%>
                                    <iframe src="DefaultNow.aspx" style="width:100%;height:100%"></iframe>
                                    <%--<iframe src="002maptestV1.html" style="width:100%;height:100%"></iframe>--%>
                                    <%--<div id="myPosition">
                                        
                                    </div>--%>
                                </div>
                                <div class="modal-footer">
                                    <input id="btnAddr" data-dismiss="modal" type="button" value="確認地址" onclick="inputAddr()" />
                                </div>
                            </div>
                        </div>
                    </div>




                </div>
            </div>
            <div <%--class="row"--%>>
                <div class="form-group">
                    <label for="txtAppointment">搭車時間</label>
                    <asp:TextBox ID="txtAppointment" placeholder="請確認搭車時間" runat="server" TextMode="DateTimeLocal" OnTextChanged="txtAppointment_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtAppointment" runat="server" ErrorMessage="時間錯誤" Display="Dynamic" ForeColor="white" CssClass="label label-danger"></asp:RequiredFieldValidator>
                    <br /><br />
                </div>
            </div>
            <div <%--class="row"--%>>
                <div class="form-group">
                    <asp:LinkButton ID="btnOrder" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnOrder_Click">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;送出
                    </asp:LinkButton>
                </div>
                <div <%--class="row"--%>>
                    <div class="form-group">
                        <a href="index.aspx" class="btn btn-danger btn-lg">
                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;回到首頁                        
                        </a>
                    </div>
                </div>
                <br />
                <br />
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
        //$('input[type="checkbox"]').addClass('form-control');
        
        
        function inputAddr() {
            //alert('test');
            var addr = localStorage.getItem("addr");
            $('#txtFrom').val(addr); 
            //$('#txtPConfirm').val(addr);
            localStorage.clear();
        }
        

        
    </script>


    
</body>
</html>
