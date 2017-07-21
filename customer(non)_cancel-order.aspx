<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer(non)_cancel-order.aspx.cs" Inherits="Register" %>

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
                            <a id="logo" class="navbar-brand" href="Index.aspx">南訓車隊預約系統</a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav navbar-right nav-tabs-vertical  <%--nav-stacked nav-justified--%>">
                                <li><a href="customer(non)_function.aspx">搭車功能選擇</a></li>
                                <%--<li><a href="#" data-toggle="modal" data-target="#driver-position">查詢司機位置</a></li>--%>
                                <%--<li><a href="#" data-toggle="modal" data-target="#modifly-order">修改訂車</a></li>--%>
                                <%--<li><a href="#" data-toggle="modal" data-target="#cancel-order">取消訂車</a></li>--%>
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
            <div class="col-xs-12 text-center">
                <span class="h2">取消目前訂車</span>
            </div><br /><br /><hr />
        
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 " >
                    <span></span>
                    
            <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;請輸入您的電話：
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="ButtonSearch" runat="server" Text="確認" ForeColor="Black" />

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString='<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>' 
                    SelectCommand="SELECT * FROM [Order] WHERE ([C_cellphone] = @C_cellphone)"
                    UpdateCommand="update [Order] set ordercancel=1 WHERE ([Ordernumber] = @Ordernumber)"
                    DeleteCommand="delete from [Order] WHERE ([Ordernumber] = @Ordernumber)"
                    >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1"  Name="C_cellphone" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
               
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="Ordernumber" AutoGenerateColumns="False" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="660px" FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" CssClass="text-center" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber"   >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="C_cellphone" HeaderText="乘客電話" SortExpression="C_cellphone" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Passengers" HeaderText="乘客人數" SortExpression="Passengers" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Starting" HeaderText="搭車地點" SortExpression="Starting" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ordertime" HeaderText="搭車時間" SortExpression="Ordertime" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                      <%--  <asp:ButtonField HeaderText="訂單選擇" ButtonType="Button" Text="取消訂單" CommandName="Update" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:ButtonField>--%>
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />



                </asp:GridView>

           </p>




                
                </div>
            </div>
            <br /><br /><hr />
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 " >
                    <a href="index.aspx" class="btn btn-success btn-lg">確定</a>
                <br /><br />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 " >
                    <a href="customer(non)_function.aspx" class ="btn btn-default btn-lg">取消</a>
                <br /><br />
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
