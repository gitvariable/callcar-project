<%@ Page Language="C#" AutoEventWireup="true" CodeFile="driverOrder.aspx.cs" Inherits="driverOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblOrderno" runat="server" Text="當前訂單"></asp:Label>
        <asp:SqlDataSource ID="DSOrder" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
            SelectCommand="SELECT * FROM [Order] WHERE ([Ordernumber] = @Ordernumber)"
            >
            <SelectParameters>
                <asp:ControlParameter ControlID="lblOrderno" Name="Ordernumber" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GVCurrent" runat="server" AutoGenerateColumns="False" DataKeyNames="Ordernumber" DataSourceID="DSOrder" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber" />
                <asp:BoundField DataField="C_cellphone" HeaderText="乘客電話" SortExpression="C_cellphone" />
                <asp:BoundField DataField="Passengers" HeaderText="搭乘人數" SortExpression="Passengers" />
                <asp:BoundField DataField="Vehicles" HeaderText="車輛數" SortExpression="Vehicles" Visible="false" />
                <asp:BoundField DataField="Starting" HeaderText="搭車地點" SortExpression="Starting" />
                <asp:BoundField DataField="Ordertime" HeaderText="Ordertime" SortExpression="Ordertime" Visible="false" />
                <asp:BoundField DataField="Dispatchtime" HeaderText="搭車時間" SortExpression="Dispatchtime" />
                <asp:CheckBoxField DataField="Ordercancel" HeaderText="Ordercancel" SortExpression="Ordercancel" Visible="false" />
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
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Ordernumber" DataSourceID="DSOrder" Height="50px" Width="125px" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber" />
                <asp:BoundField DataField="C_cellphone" HeaderText="乘客電話" SortExpression="C_cellphone" />
                <asp:BoundField DataField="Passengers" HeaderText="乘客人數" SortExpression="Passengers" />
                <asp:BoundField DataField="Vehicles" HeaderText="車輛數" SortExpression="Vehicles" />
                <asp:BoundField DataField="Starting" HeaderText="搭車地點" SortExpression="Starting" />
                <asp:BoundField DataField="Ordertime" HeaderText="Ordertime" SortExpression="Ordertime" Visible="false" />
                <asp:BoundField DataField="Dispatchtime" HeaderText="搭車時間" SortExpression="Dispatchtime" />
                <asp:CheckBoxField DataField="Ordercancel" HeaderText="Ordercancel" SortExpression="Ordercancel" Visible="false" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </form>
</body>
</html>
