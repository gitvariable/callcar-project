<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerRiderecord.aspx.cs" Inherits="managerRiderecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/manager2.css" rel="stylesheet" />

    <title>乘車紀錄頁</title>
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
                        <li><asp:Button ID="Buttonlogout" runat="server" Text="登出"/></li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>
            </nav>
        </div>
        <br/>
        <br/>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString='<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>' 
            SelectCommand="SELECT * FROM [Riderecord]"
            UpdateCommand="update [Riderecord] set Event=@Event where Ordernumber=@Ordernumber"
            >
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Ordernumber,VehicleID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"  Width="1117px">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber">
                <FooterStyle CssClass="text-center" />
                
                </asp:BoundField>
                <asp:BoundField DataField="VehicleID" HeaderText="車牌號碼" ReadOnly="True" SortExpression="VehicleID">
                <FooterStyle CssClass="text-center" />
                
                </asp:BoundField>
                <asp:BoundField DataField="Ending" HeaderText="下車地點" SortExpression="Ending">
                <FooterStyle CssClass="text-center" />
               
                </asp:BoundField>
               <%-- <asp:BoundField DataField="Startingtime" HeaderText="上車時間" SortExpression="Startingtime"></asp:BoundField>--%>
                <asp:BoundField DataField="Endingtime" HeaderText="下車時間" SortExpression="Endingtime">
                <FooterStyle CssClass="text-center" />
              
                </asp:BoundField>
<%--                <asp:BoundField DataField="Mileage" HeaderText="里程數" SortExpression="Mileage"></asp:BoundField>
                <asp:BoundField DataField="Discount" HeaderText="折扣數" SortExpression="Discount"></asp:BoundField>
                <asp:BoundField DataField="Fare" HeaderText="車資" SortExpression="Fare"></asp:BoundField>--%>
                <asp:BoundField DataField="Event" HeaderText="事件回報" SortExpression="Event">
                <FooterStyle CssClass="text-center" />
               <%-- <HeaderStyle CssClass="text-center" />--%>
                </asp:BoundField>
               <%-- <asp:BoundField DataField="Evaluation" HeaderText="Evaluation" SortExpression="Evaluation"></asp:BoundField>--%>
                <asp:CommandField ShowEditButton="True"></asp:CommandField>
                
            </Columns>
            <EditRowStyle BackColor="#7C6F57"></EditRowStyle>

            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>

            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>

            <RowStyle BackColor="#E3EAEB"></RowStyle>

            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
        </asp:GridView>

        </div>
    </form>
</body>
</html>
