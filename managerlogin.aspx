<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerlogin.aspx.cs" Inherits="ManagerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理者登入頁</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/managerlogin.css" rel="stylesheet" />
    

</head>
<body>
    <form id="form1" runat="server">
    <div>
       <div>
            <p>管理者登入頁</p>
       </div>
      

       <table id="table02" border="1">
            <tr>
                <td>帳號</td>
                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td>密碼</td>
                <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>

            <tr>
                <td colspan="2" class="text-center" >
                    <asp:Button ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" />
                </td>
            </tr>

        </table>
   
    </div>
    </form>
</body>
</html>
