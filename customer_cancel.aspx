<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer_cancel.aspx.cs" Inherits="driverPosition" %>

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
            UpdateCommand="update [Order] set ordercancel=1 WHERE ([Ordernumber] = @Ordernumber)">
            <SelectParameters>
                <asp:SessionParameter Name="C_cellphone" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Label ID="lblDP" runat="server" Text=""></asp:Label>

        <asp:GridView ID="GViewDP" OnRowDataBound="GViewDP_RowDataBound" runat="server" AutoGenerateColumns="False" DataKeyNames="Ordernumber" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GViewDP_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber" />
                <asp:BoundField DataField="Passengers" HeaderText="搭乘人數" SortExpression="Passengers" />
                <asp:BoundField DataField="Starting" HeaderText="搭車地點" SortExpression="Starting" />
                <asp:BoundField DataField="Dispatchtime" HeaderText="搭車時間" SortExpression="Dispatchtime" />
                <asp:CheckBoxField DataField="Ordercancel" HeaderText="Ordercancel" SortExpression="Ordercancel" Visible="false" />
                <asp:ButtonField HeaderText="訂單選擇" ButtonType="Button" Text="查詢位置" CommandName="DriverSite" Visible="false" />   
                <asp:CommandField HeaderText="訂單選擇" SelectText="查詢位置" ShowSelectButton="True" Visible="false" />
                <%--<asp:CommandField ShowEditButton="True" ButtonType="Button" ShowDeleteButton="true" HeaderText="取消訂單" />--%>
                <asp:ButtonField HeaderText="訂單選擇" ButtonType="Button" Text="取消訂單" CommandName="Update" />
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
