<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerOrder.aspx.cs" Inherits="managerOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>訂單管理頁面</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/manager2.css" rel="stylesheet" />
    <style>
        .pagebtn {
            color: white;
            font-size: 20pt;
            font-family: Webdings;
            text-decoration: none;
        }
    </style>
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
                        <li><asp:Button ID="Buttonlogout" runat="server" Text="登出" OnClick="Buttonlogout_Click"/></li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>
            </nav>
        </div>
        <br />
        <br />
        <br />
<%-----------------------------------------------------GridView1--------------------------------------------------------------------------------------%>
        <div style="float: left; margin-left: 30px; width: 1200px;">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                DataKeyNames="Ordernumber" DataSourceID="SqlDataSource1" AllowSorting="True" AllowPaging="True" PageSize="4"
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="1200px" OnDataBound="GridView1_DataBound" HorizontalAlign="Center"
                HeaderStyle-HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber" 
                        FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <FooterStyle HorizontalAlign="Center"></FooterStyle>
                        <HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="C_cellphone" HeaderText="客戶電話" SortExpression="C_cellphone">
                        <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>

                     <asp:BoundField DataField="Ordertime" HeaderText="訂單時間" SortExpression="Ordertime" 
                        FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <FooterStyle HorizontalAlign="Center"></FooterStyle>
                        <HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="Dispatchtime" HeaderText="派車時間" SortExpression="Dispatchtime" 
                        FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <FooterStyle HorizontalAlign="Center"></FooterStyle>
                        <HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:CheckBoxField DataField="Ordercancel" HeaderText="取消訂車" SortExpression="Ordercancel" >
                        <FooterStyle HorizontalAlign="Center"></FooterStyle>
                        <HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:CheckBoxField>

                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
                <PagerTemplate>
                    <table style="width: 100%;">
                        <tr>
                            <td>頁碼:<asp:DropDownList ID="DropDownList1" runat="server"
                                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" ForeColor="Black">
                            </asp:DropDownList>

                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="pagebtn"
                                    OnClick="DropDownList1_SelectedIndexChanged">9</asp:LinkButton>

                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="pagebtn"
                                    OnClick="DropDownList1_SelectedIndexChanged">3</asp:LinkButton>

                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="pagebtn"
                                    OnClick="DropDownList1_SelectedIndexChanged">4</asp:LinkButton>

                                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="pagebtn"
                                    OnClick="DropDownList1_SelectedIndexChanged">:</asp:LinkButton>
                            </td>
                            <td style="text-align: right">
                                <asp:Label ID="lblPageInfo" runat="server">&nbsp;</asp:Label>
                            </td>

                        </tr>

                    </table>
                </PagerTemplate>

            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>"
                SelectCommand="SELECT [Ordernumber], [C_cellphone], [Passengers], [Vehicles], [Starting], 
                    [Ordertime], [Dispatchtime], [Ordercancel] FROM [Order]"></asp:SqlDataSource>


<%------------------------------------------------- 搜尋乘客的功能，以手機搜尋-----------------------------------------------------%>
            <br />
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;請輸入要搜尋的乘客電話：<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:Button ID="ButtonSearch" runat="server" Text="確認" />

                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                    ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>"
                    SelectCommand="SELECT [Ordernumber], [C_cellphone], [Ordertime], [Dispatchtime], [Ordercancel] FROM 
                    [Order] WHERE ([C_cellphone] LIKE '%' + @C_cellphone + '%')">

                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox5" Name="C_cellphone" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                CellPadding="4" DataKeyNames="Ordernumber" DataSourceID="SqlDataSource4" ForeColor="#333333"
                GridLines="None" HorizontalAlign="Center" Width="1200px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber" 
                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                        <HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="C_cellphone" HeaderText="客戶電話" SortExpression="C_cellphone">
                        <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Ordertime" HeaderText="訂單時間" SortExpression="Ordertime" 
                        ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle CssClass="text-center" />
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Dispatchtime" HeaderText="派車時間" SortExpression="Dispatchtime" 
                        ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle CssClass="text-center" />
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="Ordercancel" HeaderText="取消訂車" SortExpression="Ordercancel" >
                        <FooterStyle HorizontalAlign="Center"></FooterStyle>
                        <HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:CheckBoxField>
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
            <div style="margin: 0px auto">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="BackButton" runat="server" Text="回首頁" OnClick="BackButton_Click" />
            </div>

        </div>

<%------------------------------------------------- DetailsView1顯示詳細清單 ---------------------------------------------------%>
        <div style="float: left">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="60px" Width="700px"
                AutoGenerateRows="False" DataSourceID="SqlDataSource2" DataKeyNames="Ordernumber"
                OnItemUpdated="DetailsView1_ItemUpdated"
                OnItemInserted="DetailsView1_ItemInserted"
                OnItemDeleted="DetailsView1_ItemDeleted"
                OnItemCommand="DetailsView1_ItemCommand"
                OnDataBound="DetailsView1_DataBound" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">

                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />

                <Fields>
                    <asp:TemplateField HeaderText="訂單編號" SortExpression="Ordernumber">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Ordernumber") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtOrdernumber" runat="server" Text='<%# Bind("Ordernumber") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtOrdernumber"
                                Display="Dynamic" runat="server" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ordernumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="客戶電話" SortExpression="C_cellphone">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtC_cellphone" runat="server" Text='<%# Bind("C_cellphone") %>' ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtC_cellphone" Display="Dynamic" 
                                runat="server" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtC_cellphone" runat="server" Text='<%# Bind("C_cellphone") %>' ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtC_cellphone" Display="Dynamic"
                                 runat="server" ErrorMessage="(必填)"  ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("C_cellphone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="人數" SortExpression="Passengers">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassengers" runat="server" Text='<%# Bind("Passengers") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassengers" runat="server"
                                ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtPassengers" runat="server" Text='<%# Bind("Passengers") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPassengers" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Passengers") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="車輛數" SortExpression="Vehicles">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtVehicles" runat="server" Text='<%# Bind("Vehicles") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtVehicles" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtVehicles" runat="server" Text='<%# Bind("Vehicles") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtVehicles" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Vehicles") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="搭車地點" SortExpression="Starting">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStarting" runat="server" Text='<%# Bind("Starting") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  ControlToValidate="txtStarting" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtStarting" runat="server" Text='<%# Bind("Starting") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtStarting" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Starting") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="訂單時間" SortExpression="Ordertime">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOrdertime" runat="server" Text='<%# Bind("Ordertime","{0:G}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtOrdertime" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtOrdertime" runat="server" Text='<%# Bind("Ordertime","{0:G}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtOrdertime" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Ordertime","{0:G}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="派車時間" SortExpression="Dispatchtime">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Dispatchtime","{0:G}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Dispatchtime","{0:G}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label17" runat="server" Text='<%# Bind("Dispatchtime","{0:G}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="取消訂車" SortExpression="Ordercancel">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Ordercancel") %>' />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Ordercancel") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Ordercancel") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowInsertButton="true" ShowDeleteButton="true" />
                </Fields>

                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>

            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                 ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
                 SelectCommand="SELECT * FROM [Order] where Ordernumber=@Ordernumber"
                 UpdateCommand="Update [Order] set C_cellphone=@C_cellphone, Passengers=@Passengers, Vehicles=@Vehicles, Starting=@Starting, Ordertime=@Ordertime, Dispatchtime=@Dispatchtime, Ordercancel=@Ordercancel where Ordernumber=@Ordernumber"
                InsertCommand="insert into [Order] Values (@Ordernumber, @C_cellphone, @Passengers, @Vehicles, @Starting, @Ordertime, @Dispatchtime, @Ordercancel)"
                DeleteCommand="delete from [Order] where Ordernumber=@Ordernumber">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Ordernumber" Type="String" />
                </SelectParameters>
                
            </asp:SqlDataSource>
            
        </div>

        <div style="float: left">
            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="700px"
                AutoGenerateRows="False" DataKeyNames="Ordernumber" DataSourceID="SqlDataSource3"
                OnItemUpdated="DetailsView1_ItemUpdated"
                OnItemInserted="DetailsView1_ItemInserted"
                OnItemDeleted="DetailsView1_ItemDeleted"
                OnItemCommand="DetailsView1_ItemCommand"
                OnDataBound="DetailsView1_DataBound" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">

                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />



                <Fields>
                    <asp:TemplateField HeaderText="訂單編號" SortExpression="Ordernumber">
                        <EditItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Ordernumber") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtOrdernumber" runat="server" Text='<%# Bind("Ordernumber") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtOrdernumber"
                                Display="Dynamic" runat="server" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Ordernumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="客戶電話" SortExpression="C_cellphone">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtC_cellphone" runat="server" Text='<%# Bind("C_cellphone") %>' ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtC_cellphone" Display="Dynamic" 
                                runat="server" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtC_cellphone" runat="server" Text='<%# Bind("C_cellphone") %>' ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtC_cellphone" Display="Dynamic"
                                 runat="server" ErrorMessage="(必填)"  ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("C_cellphone") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="人數" SortExpression="Passengers">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassengers" runat="server" Text='<%# Bind("Passengers") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassengers" runat="server"
                                ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>

                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtPassengers" runat="server" Text='<%# Bind("Passengers") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPassengers" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>

                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Passengers") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="車輛數" SortExpression="Vehicles">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtVehicles" runat="server" Text='<%# Bind("Vehicles") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtVehicles" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <insertitemtemplate>

                            <asp:textbox id="txtvehicles" runat="server" text='<%# Bind("vehicles") %>'></asp:textbox>
                            <asp:requiredfieldvalidator id="requiredfieldvalidator7" controltovalidate="txtvehicles" runat="server"
                                display="dynamic" errormessage="(必填)" forecolor="red"></asp:requiredfieldvalidator>
                        </insertitemtemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("Vehicles") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="搭車地點" SortExpression="Starting">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStarting" runat="server" Text='<%# Bind("Starting") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  ControlToValidate="txtStarting" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtStarting" runat="server" Text='<%# Bind("Starting") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtStarting" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("Starting") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="訂單時間" SortExpression="Ordertime">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOrdertime" runat="server" Text='<%# Bind("Ordertime","{0:G}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtOrdertime" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtOrdertime" runat="server" Text='<%# Bind("Ordertime","{0:G}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtOrdertime" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("Ordertime","{0:G}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="派車時間" SortExpression="Dispatchtime">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Dispatchtime","{0:G}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Dispatchtime","{0:G}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Dispatchtime","{0:G}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="取消訂車" SortExpression="Ordercancel">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Ordercancel") %>' />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Ordercancel") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Ordercancel") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                 ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
                 SelectCommand="SELECT * FROM [Order] where Ordernumber=@Ordernumber"
                 UpdateCommand="Update [Order] set C_cellphone=@C_cellphone, Passengers=@Passengers, Vehicles=@Vehicles, Starting=@Starting, Ordertime=@Ordertime, Dispatchtime=@Dispatchtime, Ordercancel=@Ordercancel where Ordernumber=@Ordernumber"
                 InsertCommand="insert into [Order] Values (@Ordernumber, @C_cellphone, @Passengers, @Vehicles, @Starting, @Ordertime, @Dispatchtime, @Ordercancel)"
                 DeleteCommand="delete from [Order] where Ordernumber=@Ordernumber">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Ordernumber" Type="String" />
                </SelectParameters>
                
            </asp:SqlDataSource>

    </div>
    </form>
</body>
</html>
