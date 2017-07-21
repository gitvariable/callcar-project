<%@ Page Language="C#" AutoEventWireup="true" CodeFile="driverNews.aspx.cs" Inherits="driverNews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #txtNews{
            background-color:aquamarine;
            font-size:20pt;
            font-family:微軟正黑體;
            color:blue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:UpdatePanel ID="UPNews" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="TimerNews" />
                </Triggers>
                <ContentTemplate>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:Timer ID="TimerNews" runat="server" Interval="3000" OnTick="TimerNews_Tick"></asp:Timer>
                    <asp:TextBox ID="txtNews" ReadOnly="true" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        
    </form>
</body>
</html>
