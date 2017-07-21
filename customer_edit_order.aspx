<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer_edit_order.aspx.cs" Inherits="customer_edit_order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
           SelectCommand="select * from [order] o where o.C_cellphone=@C_cellphone except select o.* from [order] o inner join Riderecord r on o.Ordernumber=r.Ordernumber where o.C_cellphone=@C_cellphone"
            UpdateCommand="update [order] set Passengers=@Passengers,Vehicles=@Vehicles,Starting=@Starting WHERE ([Ordernumber] = @Ordernumber)">
            
            
            <SelectParameters>
                <asp:SessionParameter SessionField="user" Name="C_cellphone" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Ordernumber" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber" />
                <asp:BoundField DataField="C_cellphone" HeaderText="C_cellphone" SortExpression="C_cellphone" Visible="false" />
                <asp:BoundField DataField="Passengers" HeaderText="搭乘人數" SortExpression="Passengers" />
                <asp:BoundField DataField="Vehicles" HeaderText="車輛數" SortExpression="Vehicles" />
                <asp:BoundField DataField="Starting" HeaderText="搭車地點" SortExpression="Starting" />
                <asp:BoundField DataField="Ordertime" HeaderText="Ordertime" SortExpression="Ordertime" Visible="false" />
                <asp:BoundField DataField="Dispatchtime" HeaderText="搭車時間" SortExpression="Dispatchtime" ReadOnly="true" />
                <asp:CheckBoxField DataField="Ordercancel" HeaderText="Ordercancel" SortExpression="Ordercancel" Visible="false" />
                <asp:CommandField ButtonType="Button" EditText="修改訂單" ShowEditButton="True" />
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
