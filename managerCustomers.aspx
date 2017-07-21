 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerCustomers.aspx.cs" Inherits="managerCustomers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客戶管理</title>
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
    <%-- 身份證驗正 --%>
    <script>
        function IDCheck(sender, args) {
            //string id = TextBox1.Text;
            var id = document.getElementById("DetailsView1_txtC_ID").value;
            //alert(id);
            var eng = new Array("A", "B", "C", "D", "E", "F", "G", "H", "J", "K",
                "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "X", "Y", "W",
                "Z", "I", "O");

            var intEng = 0;
            //alert(id.substr(0, 1));
            for (i = 0; i <= 25; i++) {
                if (eng[i] == id.substr(0, 1)) {
                    intEng = i + 10;
                    break;
                }
            }
            //JS的int不會取整數,所以要強制取整數
            var n1 = Math.floor(intEng / 10);

            var n2 = intEng % 10;
            //alert(n1+n2);

            var a = new Array(9);
            for (i = 0; i < a.length; i++) {
                a[i] = Number(id.substr(i + 1, 1));
                //alert(a[i]);
            }
            var num = 0;

            //很直接的寫法
            //num = n1 + n2 * 9 + a[0] * 8 + a[1] * 7 + a[2] * 6 + a[3] * 5 + a[4] * 4 + a[5] * 3 + a[6] * 2 + a[7] + a[8];

            ////一切以炫技為主
            for (k = 0; k < 8; k++) {
                num += a[k] * (8 - k);
                //    alert(num);
            }
            num += n1 + n2 * 9 + a[8];
            //alert(num);
            if (num % 10 == 0)
                args.IsValid = true;
            else
                args.IsValid = false;
        }
    </script>


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

        <div style="float:left;margin-left:100px;width:1000px;" >
           
            <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" AutoGenerateColumns="False"
                DataKeyNames="C_cellphone" DataSourceID="SqlDataSource1" AllowSorting="True" AllowPaging="True" PageSize="4"
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="884px" OnDataBound="GridView1_DataBound" HorizontalAlign="Center" 
                HeaderStyle-HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="C_cellphone" HeaderText="電話" ReadOnly="True" SortExpression="C_cellphone" FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
<FooterStyle HorizontalAlign="Center"></FooterStyle>

<HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="C_name" HeaderText="姓名" SortExpression="C_name" >
                    <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="C_birthday" HeaderText="生日" SortExpression="C_birthday" DataFormatString="{0:D}" FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  >
<FooterStyle HorizontalAlign="Center"></FooterStyle>

<HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Registration" HeaderText="註冊日期" SortExpression="Registration" DataFormatString="{0:D}"  FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
<FooterStyle HorizontalAlign="Center"></FooterStyle>

<HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Violations" HeaderText="違規次數" SortExpression="Violations" HeaderStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
<FooterStyle HorizontalAlign="Center"></FooterStyle>

<HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
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
                            <td style="text-align:right">
                                <asp:Label ID="lblPageInfo" runat="server">&nbsp;</asp:Label>
                            </td>

                        </tr>

                    </table>
                </PagerTemplate>

            </asp:GridView>
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
                SelectCommand="SELECT [C_cellphone], [C_password], [C_name], [C_ID], [C_birthday], [C_address],
             [Email], [Registration], [Violations] FROM [Customer]"></asp:SqlDataSource>
            
            
            <%-- 搜尋乘客的功能，以手機搜尋--%>
            <br />
             <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;請輸入要搜尋的乘客電話：
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:Button ID="ButtonSearch" runat="server" Text="確認" ForeColor="Black" />

                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
                     SelectCommand="SELECT [C_cellphone], [C_name], [C_birthday], [Registration], [Violations] FROM [Customer] WHERE ([C_cellphone] LIKE '%' + @C_cellphone + '%')">
                     
                     <SelectParameters>
                         <asp:ControlParameter ControlID="TextBox5" Name="C_cellphone" PropertyName="Text" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
           </p>

            <asp:GridView ID="GridView2" runat="server" 
                AutoGenerateSelectButton="True" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="C_cellphone" 
                DataSourceID="SqlDataSource4" ForeColor="#333333" 
                GridLines="None" HorizontalAlign="Center" Width="873px"
                OnSelectedIndexChanged="GridView2_SelectedIndexChanged"
                >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="C_cellphone" HeaderText="電話" ReadOnly="True" SortExpression="C_cellphone" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="C_name" HeaderText="姓名" SortExpression="C_name" >
                    <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="C_birthday" HeaderText="生日" SortExpression="C_birthday" DataFormatString="{0:D}" ItemStyle-HorizontalAlign="Center" >
                    <HeaderStyle CssClass="text-center" />
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Registration" HeaderText="註冊日期" SortExpression="Registration" DataFormatString="{0:D}" ItemStyle-HorizontalAlign="Center" >
                    <HeaderStyle CssClass="text-center" />
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Violations" HeaderText="違規次數" SortExpression="Violations" ItemStyle-HorizontalAlign="Center" >
                    <HeaderStyle CssClass="text-center" />
<ItemStyle HorizontalAlign="Center" CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
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
         <div style="margin:0px auto">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="BackButton" runat="server" Text="回首頁" OnClick="BackButton_Click"  />
        </div>
      
        </div>

        <%-- 點選GridView1會在DetailsView1顯示詳細清單 --%>
        <div style="float:left" >
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="400px"
                AutoGenerateRows="False" DataKeyNames="C_cellphone" DataSourceID="SqlDataSource2"
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
                    <asp:TemplateField HeaderText="電話" SortExpression="C_cellphone">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("C_cellphone") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtC_cellphone" runat="server" Text='<%# Bind("C_cellphone") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtC_cellphone"
                                Display="Dynamic" runat="server" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>

                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("C_cellphone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="密碼" SortExpression="C_password">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("C_password") %>' TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TextBox3" ControlToCompare="TextBox4" runat="server" ErrorMessage="密碼不一樣" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("C_password") %>' TextMode="Password" placeholder="密碼確認"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("C_password") %>' TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TextBox3" ControlToCompare="TextBox4" runat="server" ErrorMessage="密碼不一樣" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("C_password") %>' TextMode="Password" placeholder="密碼確認"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("C_password") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="姓名" SortExpression="C_name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtC_name" runat="server" Text='<%# Bind("C_name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtC_name" runat="server"
                                ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>

                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtC_name" runat="server" Text='<%# Bind("C_name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtC_name" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>

                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("C_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="身分證號碼" SortExpression="C_ID">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtC_ID" runat="server" Text='<%# Bind("C_ID") %>'></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="檢查" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="(格式有誤)" Display="Dynamic"
                                ControlToValidate="txtC_ID" ValidationExpression="[A-Z][12][0-9]{8}" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="CustomValidator1" ClientValidationFunction="IDCheck" runat="server" ErrorMessage="(不合法的身分證字號)"
                                ControlToValidate="txtC_ID" ForeColor="Red"></asp:CustomValidator><%-- OnServerValidate="CustomValidator1_ServerValidate"--%>
                        </EditItemTemplate>
                        <InsertItemTemplate>

                            <asp:TextBox ID="txtC_ID" runat="server" Text='<%# Bind("C_ID") %>'></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" Text="檢查" />

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="(格式有誤)" Display="Dynamic"
                                ControlToValidate="txtC_ID" ValidationExpression="[A-Z][12][0-9]{8}" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="CustomValidator1" ClientValidationFunction="IDCheck" runat="server" ErrorMessage="(不合法的身分證字號)"
                                ControlToValidate="txtC_ID" ForeColor="Red"></asp:CustomValidator><%-- OnServerValidate="CustomValidator1_ServerValidate"--%>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("C_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="生日" SortExpression="C_birthday">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("C_birthday", "{0:d}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("C_birthday", "{0:d}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("C_birthday", "{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="C_address" HeaderText="地址" SortExpression="C_address" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:TemplateField HeaderText="註冊日期" SortExpression="Registration">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Registration", "{0:d}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Registration", "{0:d}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Registration", "{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Violations" HeaderText="違規次數" SortExpression="Violations" />

                    <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowInsertButton="true" ShowDeleteButton="true" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>

            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
                SelectCommand="SELECT * FROM [Customer] where C_cellphone=@C_cellphone"
                UpdateCommand="Update Customer set C_password=@C_password,C_name=@C_name,C_ID=@C_ID,C_birthday=@C_birthday,
              C_address=@C_address,Email=@Email,Registration=@Registration,Violations=@Violations where C_cellphone=@C_cellphone"
                InsertCommand="insert into Customer Values (@C_cellphone,@C_password,@C_name,@C_ID,@C_birthday,@C_address,
              @Email,@Registration,@Violations)"
                DeleteCommand="delete from Customer where C_cellphone=@C_cellphone">
                <SelectParameters>
                  <asp:ControlParameter ControlID="GridView1" Name="C_cellphone" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>

        <div style="float:left" >
            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="400px"
                AutoGenerateRows="False" DataKeyNames="C_cellphone" DataSourceID="SqlDataSource3"
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
                    <asp:TemplateField HeaderText="電話" SortExpression="C_cellphone">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("C_cellphone") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtC_cellphone" runat="server" Text='<%# Bind("C_cellphone") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtC_cellphone"
                                Display="Dynamic" runat="server" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>

                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("C_cellphone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="密碼" SortExpression="C_password">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("C_password") %>' TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TextBox3" ControlToCompare="TextBox4" runat="server" ErrorMessage="密碼不一樣" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("C_password") %>' TextMode="Password" placeholder="密碼確認"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("C_password") %>' TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TextBox3" ControlToCompare="TextBox4" runat="server" ErrorMessage="密碼不一樣" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("C_password") %>' TextMode="Password" placeholder="密碼確認"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("C_password") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="姓名" SortExpression="C_name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtC_name" runat="server" Text='<%# Bind("C_name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtC_name" runat="server"
                                ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>

                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtC_name" runat="server" Text='<%# Bind("C_name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtC_name" runat="server"
                                Display="Dynamic" ErrorMessage="(必填)" ForeColor="red"></asp:RequiredFieldValidator>

                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("C_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="身分證號碼" SortExpression="C_ID">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtC_ID" runat="server" Text='<%# Bind("C_ID") %>'></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="檢查" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="(格式有誤)" Display="Dynamic"
                                ControlToValidate="txtC_ID" ValidationExpression="[A-Z][12][0-9]{8}" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="CustomValidator1" ClientValidationFunction="IDCheck" runat="server" ErrorMessage="(不合法的身分證字號)"
                                ControlToValidate="txtC_ID" ForeColor="Red"></asp:CustomValidator><%-- OnServerValidate="CustomValidator1_ServerValidate"--%>
                        </EditItemTemplate>
                        <InsertItemTemplate>

                            <asp:TextBox ID="txtC_ID" runat="server" Text='<%# Bind("C_ID") %>'></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" Text="檢查" />

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="(格式有誤)" Display="Dynamic"
                                ControlToValidate="txtC_ID" ValidationExpression="[A-Z][12][0-9]{8}" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="CustomValidator1" ClientValidationFunction="IDCheck" runat="server" ErrorMessage="(不合法的身分證字號)"
                                ControlToValidate="txtC_ID" ForeColor="Red"></asp:CustomValidator><%-- OnServerValidate="CustomValidator1_ServerValidate"--%>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("C_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="生日" SortExpression="C_birthday">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("C_birthday", "{0:d}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("C_birthday", "{0:d}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("C_birthday", "{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="C_address" HeaderText="地址" SortExpression="C_address" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:TemplateField HeaderText="註冊日期" SortExpression="Registration">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Registration", "{0:d}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Registration", "{0:d}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Registration", "{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Violations" HeaderText="違規次數" SortExpression="Violations" />

                    <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowInsertButton="true" ShowDeleteButton="true" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
                SelectCommand="SELECT * FROM [Customer] where C_cellphone=@C_cellphone"
                UpdateCommand="Update Customer set C_password=@C_password,C_name=@C_name,C_ID=@C_ID,C_birthday=@C_birthday,
              C_address=@C_address,Email=@Email,Registration=@Registration,Violations=@Violations where C_cellphone=@C_cellphone"
                InsertCommand="insert into Customer Values (@C_cellphone,@C_password,@C_name,@C_ID,@C_birthday,@C_address,
              @Email,@Registration,@Violations)"
                DeleteCommand="delete from Customer where C_cellphone=@C_cellphone">
                <SelectParameters>
                     <asp:ControlParameter ControlID="GridView2"  Name="C_cellphone" Type="String" />
                </SelectParameters>
                  </asp:SqlDataSource>

      
        </div>
      
    </form>
</body>

</html>
