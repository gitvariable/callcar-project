<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerDandC.aspx.cs" Inherits="DandC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>司機車輛資料表</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/manager2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
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
                        <li><asp:Button ID="Buttonlogout" runat="server" Text="登出" OnClick="Buttonlogout_Click" /></li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>
            </nav>
        </div>
        <br />
        <br />
        <br />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
            SelectCommand="DriverwithCar" SelectCommandType="StoredProcedure"
            
            ></asp:SqlDataSource>
        <%-- 部分顯示用 GridView  GridView可查詢司機個人與車輛資料--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" AutoGenerateColumns="False" 
            DataKeyNames="DriverID,VehicleID" DataSourceID="SqlDataSource1" AllowPaging="True"
            HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" 
            CellPadding="4" PageSize="2" ForeColor="#333333" GridLines="None" Width="800px" 
            >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="DriverID" HeaderText="司機編號" ReadOnly="True" SortExpression="DriverID" HeaderStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="D_name" HeaderText="司機姓名" SortExpression="D_name" >
                <HeaderStyle CssClass="text-center" />
                </asp:BoundField>
                <asp:BoundField DataField="D_cellphone" HeaderText="司機電話" SortExpression="D_cellphone" >
                <HeaderStyle CssClass="text-center" />
                </asp:BoundField>
                <asp:BoundField DataField="VehicleID" HeaderText="車牌號碼" ReadOnly="True" SortExpression="VehicleID" >

                <HeaderStyle CssClass="text-center" />
                </asp:BoundField>

            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />

<RowStyle HorizontalAlign="Center" BackColor="#E3EAEB"></RowStyle>
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
            

        <div style="text-align:center;">
            <p>沒有車輛的司機編號</p>
         <%--沒有車輛的司機 --%>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="DriverID" DataSourceID="SqlDataSource4" Width="184px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="DriverID" HeaderText="司機編號" ReadOnly="True" SortExpression="DriverID">
                        <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>
                <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>
                <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>
                <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>
                <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>
                <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>
                <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>' SelectCommand="DriverNoCar" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
       
        </div>

        <br />
        <br />
       <%-- 資料庫 --%>
        <%-- 司機個人資料庫連結 --%>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
            SelectCommand="SELECT * FROM [Driver] where DriverID=@DriverID"
            InsertCommand="Insert into [Driver](DriverID,D_password,D_ID,D_name,D_birthday,D_address, D_cellphone, Licensenumber) values (@DriverID,@D_password,@D_ID,@D_name,@D_birthday,@D_address,@D_cellphone,@Licensenumber)"
            UpdateCommand="Update [Driver] set D_password=@D_password,D_ID=@D_ID,D_name=@D_name,D_birthday=@D_birthday,D_address=@D_address,D_cellphone=@D_cellphone,Licensenumber=@Licensenumber where DriverID=@DriverID"
            DeleteCommand="Delete from [Driver] where DriverID=@DriverID"
        >
            <%-- 點選GridView1會顯示個人資料 --%>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="DriverID" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
        <%-- 車輛個人資料庫連結 --%>
       <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
            SelectCommand="SELECT * FROM [Car] where DriverID=@DriverID" 
            InsertCommand="Insert into [Car] values (@VehicleID,@DriverID,@People,@Charter,@Roofrack,@Nosmoking,@Pet,@Barrierfree,@Brand,@Productiondate)"
            UpdateCommand="Update [Car] set VehicleID=@VehicleID,People=@People,Charter=@Charter,Roofrack=@Roofrack,Nosmoking=@Nosmoking,Pet=@Pet,Barrierfree=@Barrierfree,Brand=@Brand,Productiondate=@Productiondate  where  DriverID=@DriverID"
            DeleteCommand="Delete from [Car] where VehicleID=@VehicleID"
         >
            <%-- 點選GridView1會顯示個人資料 --%>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="DriverID" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>

    <p style="text-align:center;color:red;font-size:40pt">
        請先新增司機個人資料表後，再新增車輛資料
    </p>


            <%-- 司機資料表 的新增、修改、刪除 --%>
        <table style="margin:auto; width: 1265px;">
            <tr>
                <td style="vertical-align:top">
        <asp:DetailsView ID="DetailsView3" HeaderText="司機個人資料表" runat="server" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="DriverID" DataSourceID="SqlDataSource2" Height="50px" Width="620px" 
            HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
            
            <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="Black" />
            <%-- 內容為空白，就用按鈕顯示新增 --%>
            <EmptyDataTemplate>
                <asp:Button ID="Button1" runat="server" Text="新增司機" CommandName="New"/>
            </EmptyDataTemplate>

            <Fields>
                <asp:BoundField DataField="DriverID" HeaderText="司機編號" ReadOnly="True" SortExpression="DriverID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
                
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="司機密碼" SortExpression="D_password" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("D_password") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("D_password") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("D_password") %>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="司機身分證字號" SortExpression="D_ID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("D_ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("D_ID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("D_ID") %>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="司機姓名" SortExpression="D_name" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("D_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("D_name") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("D_name") %>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="司機生日" SortExpression="D_birthday" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("D_birthday","{0:d}") %>'></asp:TextBox><%-- /**/--%>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("D_birthday") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("D_birthday","{0:D}") %>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="司機住址" SortExpression="D_address" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("D_address") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("D_address") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("D_address") %>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="司機手機" SortExpression="D_cellphone" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("D_cellphone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("D_cellphone") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("D_cellphone") %>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="執照證號" SortExpression="Licensenumber" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Licensenumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Licensenumber") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Licensenumber") %>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" NewText="新增司機" EditText="修改個人資料" ButtonType="Button" />
            </Fields>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle ForeColor="#003399" HorizontalAlign="Left" BackColor="#99CCCC" />
            <RowStyle ForeColor="#003399" BackColor="White" />
        </asp:DetailsView>
        </td>

        <%-- 車輛資料表 的新增、修改、刪除 --%>
        <td>         
        <asp:DetailsView ID="DetailsView2" HeaderText="車輛資料表" runat="server" 
            AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
            DataKeyNames="VehicleID" DataSourceID="SqlDataSource3" Height="50px" Width="625px" HorizontalAlign="Center"
            HeaderStyle-HorizontalAlign="Center">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="Black" />
            <%-- 內容為空白 --%>
            <EmptyDataTemplate>
                <asp:Button ID="Button2" runat="server" Text="新增車輛" CommandName="New" />
            </EmptyDataTemplate>

            <Fields>
                <asp:BoundField DataField="VehicleID" HeaderText="車牌號碼" ReadOnly="True" SortExpression="VehicleID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  />
                <asp:BoundField DataField="DriverID" HeaderText="司機編號" SortExpression="DriverID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  />
                <asp:TemplateField HeaderText="可載人數" SortExpression="People" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("People") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("People") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("People") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="可否包車" SortExpression="Charter"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Charter") %>' />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Charter") %>' />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Charter") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="有無車頂架" SortExpression="Roofrack"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Roofrack") %>' />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Roofrack") %>' />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Roofrack") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="是否抽菸" SortExpression="Nosmoking"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Nosmoking") %>' />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Nosmoking") %>' />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Nosmoking") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="可載寵物" SortExpression="Pet"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Pet") %>' />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Pet") %>' />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Pet") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="無障礙設施" SortExpression="Barrierfree"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Barrierfree") %>' />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Barrierfree") %>' />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Barrierfree") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="廠牌" SortExpression="Brand"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="出廠日期" SortExpression="Productiondate"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Productiondate","{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Productiondate") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Productiondate","{0:D}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" NewText="新增車輛" EditText="修改車輛資料" DeleteText="刪除資料" ButtonType="Button"   />
            </Fields>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:DetailsView>
                 </td>
            </tr>
        </table>


       
         

        <div style="text-align:center">
            <div style="margin:0px auto">
                <asp:Button ID="BackButton" runat="server" Text="回首頁" OnClick="BackButton_Click"  />
            </div>

             
        </div>
    </form>
</body>
</html>
