<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecordQuery.aspx.cs" Inherits="RecordQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="dsRecord" runat="server" ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
            SelectCommand="SELECT r.* FROM [Order] o inner join riderecord r on o.ordernumber=r.ordernumber where o.C_cellphone=@phone">
            <SelectParameters>
                <asp:SessionParameter Name="phone" SessionField="user" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gviewRecord" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Ordernumber,VehicleID" DataSourceID="dsRecord">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber" />
                <asp:BoundField DataField="VehicleID" HeaderText="車牌號碼" ReadOnly="True" SortExpression="VehicleID" />
                <asp:BoundField DataField="Ending" HeaderText="下車地點" SortExpression="Ending" />
                <asp:BoundField DataField="Startingtime" HeaderText="Startingtime" SortExpression="Startingtime" Visible="false" />
                <asp:BoundField DataField="Endingtime" HeaderText="下車時間" SortExpression="Endingtime" />
                <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" Visible="false" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" Visible="false" />
                <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" Visible="false" />
                <asp:BoundField DataField="Event" HeaderText="Event" SortExpression="Event" Visible="false" />
                <asp:BoundField DataField="Evaluation" HeaderText="Evaluation" SortExpression="Evaluation" Visible="false" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
