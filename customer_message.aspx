<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer_message.aspx.cs" Inherits="customer_message2_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id="Head1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>訊息主畫面</title>
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div id="message">
             訊息室&nbsp; <%--<span class="style1">AJAX</span>--%>
        <hr />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <asp:Label ID="Label_timer" runat="server"
                    Style="color: #FFFF66; background-color: #0000FF"></asp:Label>&nbsp;/ 每0.5秒透過AJAX更新一次畫面<hr />

                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Timer ID="Timer1" runat="server" Interval="500" OnTick="Timer1_Tick">
                </asp:Timer>
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
        <hr />

       <%-- 訊息內容：<asp:TextBox ID="TextBox1" runat="server" Width="348px"></asp:TextBox>
        &nbsp;<asp:Button ID="Button1" runat="server" Text="Submit/送出" OnClick="Button1_Click" />
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="TextBox1" ErrorMessage="不可以空白！" Style="text-align: center"></asp:RequiredFieldValidator>
        <br />
        <br />--%>
        

        </div>


    </div>
    </form>
</body>
</html>
