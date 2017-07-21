<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer_modifly-Profiles.aspx.cs" Inherits="Profiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <link href="NMRStyle.css" rel="stylesheet" />
    <link href="Content/NMRStyle.css" rel="stylesheet" />
    <style>
        #myNavbar .active{
            background-color:darkblue;
        }
    </style>
    <script>
        $(document).ready(function () {
            $(document).click(function () {
                if (!$('#myNavbar').is(':hidden'))
                    $('#myNavbar').hide();
            });
        });
    </script>
</head>
<body>
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
                            <a class="navbar-brand" href="Index.aspx" style="color: white;">南訓車隊預約系統</a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav navbar-right nav-tabs-vertical  <%--nav-stacked nav-justified--%>">
                                <%--<li class="active"><a href="#member" data-toggle="tab">會員資料</a></li>--%>
                                <%--<li><a href="#order" data-toggle="tab">訂單資料</a></li>--%>
                                <%--<li><a href="#complete">乘車記錄</a></li>--%>
                                <li><a href="#" data-toggle="modal" data-target="#modifly-order">修改訂車</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#cancel-order">取消訂車</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#travel-record-list">乘車紀錄查詢</a></li>
                                <li><a href="index.aspx">登出帳號</a></li>
                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp</li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <div id="home" class="<%--tab---%>content">
            <br />
            <br />
            <br />
            <br />
            <div class="col-xs-12 <%--jumbotron--%> text-center">
                <span class="h2">帳號資料修改</span>
            </div>
            <br />
            <br />
            <hr />
        </div>
        <div class="row">
            <div class="col-lg-offset-5 col-lg-7 col-md-offset-4 col-md-8 col-sm-offset-4 col-sm-8<%-- col-xs-offset-3 col-xs-9--%> " >
            <div class="tab-pane active" id="member">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                   ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
                    ProviderName="System.Data.SqlClient"
                    SelectCommand="select * from Customer where C_cellphone=@phone"
                    UpdateCommand="update Customer set C_name=@name,C_id=@id,C_address=@addr,email=@mail,C_birthday=@birth where C_cellphone=@phone">
                     <SelectParameters>
                            <asp:SessionParameter Name="phone" SessionField="user" />
                     </SelectParameters>
                    <UpdateParameters>
                        <%--<asp:ControlParameter ControlID="txtName" Name="name" Type="String" />
                            <asp:ControlParameter ControlID="txtID" Name="id" Type="String" />
                            <asp:ControlParameter ControlID="txtAddr" Name="addr" Type="String" />
                            <asp:ControlParameter ControlID="txtMail" Name="mail" Type="String" />--%>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="id" Type="String" />
                        <asp:Parameter Name="addr" Type="String" />
                        <asp:Parameter Name="mail" Type="String" />
                        <asp:Parameter Name="birth" Type="String" />
                        <asp:SessionParameter Name="phone" SessionField="user" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:DataList ID="DLPersonal" runat="server" DataKeyField="C_cellphone"
                    DataSourceID="SqlDataSource1" OnUpdateCommand="DLPersonal_UpdateCommand"
                    OnEditCommand="DLPersonal_EditCommand" OnCancelCommand="DLPersonal_CancelCommand">
                    <ItemTemplate>
                        <%--<div class="jumbotron">--%>
                            <h1><span class="label label-primary">我的基本資料</span></h1>
                       <%-- </div>--%>
                        <div class="row form-group">
                            <div class="col-xs-6">
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-success">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;編輯我的資料
                                </asp:LinkButton>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-primary">姓名：</span>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="C_nameLabel" runat="server" Text='<%# Eval("C_name") %>' />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-primary">身分證號碼：</span>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("C_id") %>' />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-primary">電話：</span>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("C_cellphone") %>' />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-primary">地址：</span>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("C_address") %>' />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-primary">Email：</span>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("email") %>' />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-primary">生日：</span>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("C_birthday","{0:d}") %>' />
                            </div>
                        </div>
                        <hr />


                        <%--C_cellphone:
                <asp:Label ID="C_cellphoneLabel" runat="server" Text='<%# Eval("C_cellphone") %>' />
                <br />
                C_password:
                <asp:Label ID="C_passwordLabel" runat="server" Text='<%# Eval("C_password") %>' />
                <br />
                C_name:
                <asp:Label ID="C_nameLabel" runat="server" Text='<%# Eval("C_name") %>' />
                <br />
                C_ID:
                <asp:Label ID="C_IDLabel" runat="server" Text='<%# Eval("C_ID") %>' />
                <br />
                C_birthday:
                <asp:Label ID="C_birthdayLabel" runat="server" Text='<%# Eval("C_birthday") %>' />
                <br />
                C_address:
                <asp:Label ID="C_addressLabel" runat="server" Text='<%# Eval("C_address") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                <br />
                Registration:
                <asp:Label ID="RegistrationLabel" runat="server" Text='<%# Eval("Registration") %>' />
                <br />
                Violations:
                <asp:Label ID="ViolationsLabel" runat="server" Text='<%# Eval("Violations") %>' />
                <br />
            <br />--%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <%--<div class="jumbotron">--%>
                            <h1><span class="label label-success">我的基本資料</span></h1>
                        <%--</div>--%>
                        <div class="row form-group">
                            <div class="col-xs-10">
                                <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-primary">
                                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> &nbsp;&nbsp;確認
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-danger">
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> &nbsp;&nbsp;取消
                                </asp:LinkButton>
                            </div>
                        </div>
                        <%--<div class="row form-group">
                                <div class="col-xs-6">
                                    <label for="txtName" class="label label-success">姓名:</label>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("C_name") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>--%>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-success">姓名：</span>
                            </div>
                            <div class="col-xs-6">
                                <%--<asp:Label ID="C_nameLabel" runat="server" Text='<%# Eval("C_name") %>' />--%>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("C_name") %>' CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-success">身分證號碼：</span>
                            </div>
                            <div class="col-xs-6">
                                <%--<asp:Label ID="Label5" runat="server" Text='<%# Eval("C_id") %>' />--%>
                                <asp:TextBox ID="txtID" runat="server" Text='<%# Eval("C_id") %>' CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-success">電話：</span>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("C_cellphone") %>' />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-success">地址：</span>
                            </div>
                            <div class="col-xs-6">
                                <%--<asp:Label ID="Label4" runat="server" Text='<%# Eval("C_address") %>' />--%>
                                <asp:TextBox ID="txtAddr" runat="server" Text='<%# Eval("C_address") %>' CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-success">Email：</span>
                            </div>
                            <div class="col-xs-6">
                                <%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("email") %>' />--%>
                                <asp:TextBox ID="txtMail" runat="server" Text='<%# Eval("email") %>' CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-success">密碼：</span>
                            </div>
                            <div class="col-xs-6">
                                <%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("email") %>' />--%>
                                <asp:TextBox ID="txtPwd" runat="server" Text='<%# Eval("C_password") %>' TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="label label-success">生日：</span>
                            </div>
                            <div class="col-xs-6">
                                <%--<asp:Label ID="Label3" runat="server" Text='<%# Eval("C_birthday","{0:d}") %>' />--%>
                                <asp:TextBox ID="txtBirth" runat="server" Text='<%# Eval("C_birthday","{0:d}") %>' TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                    </EditItemTemplate>
                </asp:DataList>
            </div>
                <div class="form-group">
                        <a href="customer_function.aspx" class="btn btn-danger btn-lg">
                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;回到功能頁                        
                        </a>
                    </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6 " >
            <div class="tab-pane" id="order">
                <%--<div class="well">--%>
                    <%--<div class="jumbotron">
                        <asp:Label ID="OrderName" runat="server" Text="訂單資料" CssClass="h3"></asp:Label>
                    </div>--%>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>"
                        SelectCommand="select * from [Order] where C_cellphone=@phone and Ordercancel=0"
                        UpdateCommand="update [Order] set OrderCancel=1 where OrderNumber=@orderno">
                        <SelectParameters>
                            <asp:SessionParameter Name="phone" SessionField="user" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="orderno" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GVOrder" DataSourceID="SqlDataSource2" AutoGenerateColumns="false" CssClass="table table-responsive" runat="server" Visible="false"
                        OnRowCommand="GVOrder_RowCommand" OnRowDataBound="GVOrder_RowDataBound" OnRowUpdated="GVOrder_RowUpdated">
                        <Columns>
                            <asp:BoundField DataField="OrderNumber" ReadOnly="true" SortExpression="OrderNumber" HeaderText="訂單編號" />
                            <asp:BoundField DataField="Starting" ReadOnly="true" SortExpression="Starting" HeaderText="搭車地點" />
                            <asp:BoundField DataField="Dispatchtime" ReadOnly="true" SortExpression="Dispatchtime" HeaderText="搭車時間" />
                            <asp:ButtonField CommandName="Update" ButtonType="Button" HeaderText="取消訂單" Text="取消" />
                        </Columns>
                    </asp:GridView>
               <%-- </div>--%>
            </div>
        </div>

        </div>
        <div class="footer-row">
            <footer class="navbar navbar-fixed-bottom">

                <div style="line-height: 32px; color: white; text-align: center; background-color: #1ba1e2;">
                    <span><strong><span style="font-size: 16px;">南訓車隊</span></strong><br />
                        <span style="font-size: 16px; letter-spacing: 1px"><strong>服務電話：</strong><a href="tel:0972606088">0973-212-338&nbsp;&nbsp;&nbsp;</a><strong><br />
                            信箱：</strong> </span></span>
                    <span style="font-size: 16px; letter-spacing: 1px"><a href="mailto:hjbhb@gmail.com"><span style="color: white">solid9889@gmail.com</span></a></span>
                </div>
                <%--<span class="text-muted">Place sticky footer content here.</span>--%>
            </footer>
        </div>
    </form>
</body>
</html>
