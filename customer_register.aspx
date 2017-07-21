<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer_register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/NMRStyle.css" rel="stylesheet" />
    <script src="Scripts/addr.js"></script>
    <script>
        $(document).ready(function () {            
            $('.form-group').addClass('col-lg-offset-4 col-lg-4 col-md-offset-4 col-md-4 col-sm-offset-4 col-sm-4');
            //$("form").submit(function () {
            //    alert("送出");
            //});
		startAddr();
        });
    </script>
    <style>
        .label{
            font-size:10pt;
        }
    </style>
</head>
<body>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
        InsertCommand="insert into Customer values(@phone,@pwd,@name,@id,@birth,@addr,@mail,@rdate,0)" 
        SelectCommand="select * from Customer">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtName" Name="name" Type="String" />
            <asp:ControlParameter ControlID="txtTel" Name="phone" Type="String" />
            <asp:ControlParameter ControlID="txtPassword" Name="pwd" Type="String" />
            <asp:ControlParameter ControlID="txtEmail" Name="mail" Type="String" />
            <asp:ControlParameter ControlID="txtAddr" Name="addr" Type="String" />
            <asp:ControlParameter ControlID="txtBirth" Name="birth" Type="String" />
            <asp:ControlParameter ControlID="txtID" Name="id" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <form id="form1" runat="server">
        <header class="header navbar-fixed-top">
      <div class="container" >
        <div class="text-muted" >
            <nav class="navbar navbar-default navbar-fixed-top" style="background-color:#1ba1e2/*#403b3b*/; /*opacity:0.5*/">
                <div class="navbar-header" >
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <!--可用&equiv;替代-->
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a id="logo" class="navbar-brand" href="Index.aspx">南訓車隊預約系統</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right nav-tabs-vertical  <%--nav-stacked nav-justified--%>">
                        <li><a href="#member" data-toggle="tab">會員資料</a></li>
                        <li><a href="#order" data-toggle="tab">訂單資料</a></li>
                        <li><a href="#complete">乘車記錄</a></li>
                        <li><a href="#contact">聯絡我們</a></li>
                    </ul>
                </div>
            </nav>
        </div>
      </div>
    </header>
    <div class="well">
        <br /><br /><br />
                <div class="row">
                    <div class="form-group">
                        <label for="txtName">姓名</label>
                        <asp:TextBox ID="txtName" placeholder="請輸入姓名" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NameRequired" ControlToValidate="txtName" Display="Dynamic" ForeColor="white" CssClass="label label-danger" runat="server" ErrorMessage="必填欄位"></asp:RequiredFieldValidator>
                    </div>
                </div>

        <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
                <div class="row">
                    <div class="form-group">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <label for="txtTel">行動電話(登入帳號，註冊後不可更改)</label>
                                <asp:TextBox ID="txtTel" runat="server" AutoPostBack="true" OnTextChanged="txtTel_TextChanged" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="TelRequired" ControlToValidate="txtTel" Display="Dynamic" ForeColor="white" CssClass="label label-danger" runat="server" ErrorMessage="必填欄位"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="TelFormat" runat="server" ErrorMessage="請輸入正確的行動電話" ControlToValidate="txtTel" ValidationExpression="(09)[0-9]{8}" ForeColor="white" CssClass="label label-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:Label ID="lblTelAgain" runat="server" Text=""></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        
                        <%--<asp:TextBox ID="txtTel" placeholder="請輸入手機號碼" runat="server"></asp:TextBox>--%>
                        
                        <%--<asp:Button ID="btnTelRepeat" runat="server" Text="Button" />--%>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="txtAddr">地址</label>
                        <asp:TextBox ID="txtAddr" placeholder="請輸入地址" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AddrRequired" ControlToValidate="txtAddr" Display="Dynamic" ForeColor="white" CssClass="label label-danger" runat="server" ErrorMessage="必填欄位"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="txtID">身分證號碼</label>
                        <asp:TextBox ID="txtID" placeholder="請輸入身分證號碼" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="IDRequired" ControlToValidate="txtID" Display="Dynamic" ForeColor="white" CssClass="label label-danger" runat="server" ErrorMessage="必填欄位"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="IDFormat" runat="server" ErrorMessage="請輸入正確的身分證字號" ControlToValidate="txtID" ValidationExpression="[A-Za-z](1|2)[0-9]{8}" ForeColor="white" CssClass="label label-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="txtBirth">生日</label>
                        <asp:TextBox ID="txtBirth" placeholder="請選擇生日" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="BirthRequired" ControlToValidate="txtBirth" Display="Dynamic" ForeColor="white" CssClass="label label-danger" runat="server" ErrorMessage="必填欄位"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" placeholder="請輸入電子郵件信箱" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="MailRequired" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="white" CssClass="label label-danger" runat="server" ErrorMessage="必填欄位"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="txtPassword">密碼</label>
                        <asp:TextBox ID="txtPassword" placeholder="請輸入最多10位數密碼" runat="server" TextMode="Password" MaxLength="10" MinLength="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="white" CssClass="label label-danger" runat="server" ErrorMessage="必填欄位"></asp:RequiredFieldValidator>                        
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="txtPwd2">密碼(確認)</label>
                        <asp:TextBox ID="txtPwd2" placeholder="請確認密碼" runat="server" TextMode="Password" MaxLength="10" MinLength="6"></asp:TextBox>    
                        <asp:RequiredFieldValidator ID="ConfirmPwd" ControlToValidate="txtPwd2" Display="Dynamic" ForeColor="white" CssClass="label label-danger" runat="server" ErrorMessage="請確認密碼"></asp:RequiredFieldValidator>                    
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <asp:LinkButton ID="btnSend" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnSend_Click">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;註冊
                        </asp:LinkButton>
                        </div>
                     <div class="form-group">   
                        <a href="Index.aspx" class="btn btn-danger btn-lg">
                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;回到首頁                        
                        </a>
                         </div>
                    </div>
                </div>
        
    </div>
        <div class="row">
    <footer id="copyright" class="footer navbar-static-bottom">
      
          <div style="line-height: 32px; color:white;text-align: center;background-color:#1ba1e2;"  >
              <span ">
                  <strong><span style="font-size:16px;">南訓車隊</span></strong>
              <span style="font-size:16px;letter-spacing:1px"><strong>服務電話：</strong>（07）821-0171&nbsp;&nbsp;&nbsp;<strong>信箱：</strong> </span></span>
              <span style="font-size:16px;letter-spacing:1px"><a href="mailto:hjbhb@gmail.com"><span style="color:white" >solid9889@gmail.com</span></a></span></div>

        <%--<span class="text-muted">Place sticky footer content here.</span>--%>
      
    </footer>
    </div>
    </form>
    <script>        
        $('input[type="text"]').addClass('form-control');
        $(':password').addClass('form-control');
        $('input[type="date"]').addClass('form-control');
        //$('input[type="text"]').attr("placeholder", "test");
        //$('#txtPwd2').attr("placeholder", "test"); 
        //startAddr();
        
    </script>
</body>
</html>
