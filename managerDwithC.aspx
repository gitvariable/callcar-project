<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerDwithC.aspx.cs" Inherits="CustomerDriver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    
    <title></title>
    <script>
        $(document).ready(function () {
            //$('#btnMatch').click(function () {
            //    //alert($('#lblDriver').text);

            //});

        });
    </script>
    <style>

        body {
            background-image: url('../Images/managerindex.png');
            color:white;
        }


     /* 設定地圖顯示的 css */
      /*html, body,form, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }*/     
      html, body,form{
          height: 100%;
            margin: 0px;
            padding: 0px
      }

      #map-canvas {
        height: 60%;
      }
      #order,#driver{
          width:50%;
      }

      #txtDP{
          display:none;
      }

      #transaction,#driverTd{
          font-size:15pt;
      }
      
    </style>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvRfqSnqG4lwB6goW_wUgAB3S2zzbRqmQ&?v=3.exp&sensor=false"></script>

    <script>
        //取得乘客經緯度
        var map;
        var latng;

        var customer = '<%=getPosition()%>';
var correctPoint;

if (customer == undefined)
    customer = "高雄夢時代"

var requestURL = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + customer + '&key=AIzaSyCvRfqSnqG4lwB6goW_wUgAB3S2zzbRqmQ';
var request = new XMLHttpRequest();
request.open('GET', requestURL);
request.responseType = 'json';
request.send();

request.onload = function () {
    latng = request.response;
    correctPoint = latng.results[0].geometry.location;
}



function initialize() {
    var orderno = document.getElementById('lblOrder').innerText;

    //取得目標的經緯度
    var latlng = new google.maps.LatLng(22.5950447, 120.3071367);

    if (correctPoint != "")
        latlng = correctPoint;

    //設定地圖的選項
    var mapOptions = {
        zoom: 15, //地圖縮放的層級
        center: latlng, //地圖中心擺放位置
        mapTypeId: google.maps.MapTypeId.TERRAIN //地圖呈現的方式
    };

    //把地圖放在頁面的 div 裡
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    //宣告地圖標記選項
    var markerOptions = {
        //地圖標記位置
        position: latlng,
        //設定要套用的地圖
        map: map,
        //地圖標記要顯示的文字
        title: orderno,
        icon: "Images/ic_accessibility_black_24dp_2x.png"
    }

    //把地圖標記標示在地圖上
    var marker = new google.maps.Marker(markerOptions);
}




        //For Driver(將司機位置加入地圖)
function addrToPosition(addr, driv) {
    var requestURL = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + addr + '&key=AIzaSyCvRfqSnqG4lwB6goW_wUgAB3S2zzbRqmQ';
    var request = new XMLHttpRequest();
    request.open('GET', requestURL);
    request.responseType = 'json';
    request.send();

    request.onload = function () {
        latng = request.response;
        mapMark(latng, driv);
    }
}

function mapMark(latng, did) {
    //alert('test');

    //宣告地圖標記選項

    var markerOptions = {
        //地圖標記位置
        position: latng.results[0].geometry.location,
        //設定要套用的地圖
        map: map,
        //地圖標記要顯示的文字
        title: did
    }

    //把地圖標記標示在地圖上
    var marker = new google.maps.Marker(markerOptions);

    google.maps.event.addListener(marker, 'click', function (event) {
        //if (!confirm('確定選擇司機嗎?')) {
        //    return false;
        //} else {
        //    return true;
        //}
        $('#lblDPosition').text(latng.results[0].formatted_address);
        $('#lblDriver').text(did);
    });
}
    </script>
</head>
<body onload="initialize();">
    <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:Button ID="btnOn" runat="server" Text="啟用排班系統" OnClick="btnOn_Click" Visible="false" />
                    <%-- 由於資料庫沒有司機位置資料表，用此按鈕直接新增 --%>
                 <asp:Button ID="btnOff" runat="server" Text="更新排班系統" OnClick="btnOff_Click" CssClass="btn btn-primary" Visible="true" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Network_Motorcade_Appointment_SystemConnectionString %>" 
                         SelectCommand="select * from [order] o except select o.* from [order] o inner join Riderecord r on o.Ordernumber=r.Ordernumber"
                        
                        >
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridViewPassenger" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Ordernumber" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewPassenger_SelectedIndexChanged" PageSize="3" AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Ordernumber" HeaderText="訂單編號" ReadOnly="True" SortExpression="Ordernumber" />
                            <asp:BoundField DataField="C_cellphone" HeaderText="乘客電話" SortExpression="C_cellphone" />
                            <asp:BoundField DataField="Passengers" HeaderText="搭乘人數" SortExpression="Passengers" />
                            <asp:BoundField DataField="Vehicles" HeaderText="車輛數" SortExpression="Vehicles" />
                            <asp:BoundField DataField="Starting" HeaderText="搭乘地點" SortExpression="Starting" />
                            <asp:BoundField DataField="Dispatchtime" HeaderText="搭車時間" SortExpression="Dispatchtime" />
                            <asp:CheckBoxField DataField="Ordercancel" HeaderText="取消訂單" SortExpression="Ordercancel" />
                            <asp:CommandField HeaderText="查看乘客位置" SelectText="選擇乘客" ShowSelectButton="True" />
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
                </td>
                <td id="transaction">
                    
                    <span class="label label-primary">訂單編號:</span>
                    <asp:Label ID="lblOrder" runat="server" Text="請選擇乘客"></asp:Label>
                    <span class="label label-primary">司機編號:</span>
                    <asp:Label ID="lblDriver" runat="server" Text="請選擇司機"></asp:Label>
                    <asp:Label ID="lblDPosition" runat="server" Text="司機位置"></asp:Label>

                    <%--<asp:TextBox ID="txtSpecified" runat="server" placeholder="傳送訊息至特定司機"></asp:TextBox>
                    <asp:Button ID="btnSpecified" runat="server" Text="傳送訊息" />--%>
                    
                    <br/>
                    <br/>
                    <input type="button" onclick="onclickget()" value="訂單成立" class="btn btn-primary" />

                    <asp:Button ID="btnMatch" Visible="false" runat="server" Text="訂單成立" CssClass="btn btn-primary" OnClick="btnMatch_Click" />
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="TimerDriver" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:Timer ID="TimerDriver" runat="server" Interval="1000" OnTick="TimerDriver_Tick"></asp:Timer>                            
                    
                            <%--<asp:Button ID="btnMatch" runat="server" Text="訂單成立" CssClass="btn btn-primary" OnClick="btnMatch_Click" />--%>
                            <asp:TextBox ID="txtReceive" runat="server" Rows="6" TextMode="MultiLine" ReadOnly="true" placeholder="司機回傳訊息" Width="250px" ForeColor="Black"></asp:TextBox>
                            <asp:TextBox ID="txtDP" runat="server" Rows="6" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>

                            <asp:Button ID="btnMsgDelete" runat="server" Text="清除訊息" CssClass="btn btn-danger" OnClick="btnMsgDelete_Click" />
                            <input id="btnDP" type="button" value="更新司機位置" class="btn btn-success" onclick="dpclick()" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td id="driverTd">
                    
                </td>
                <td>
                    <asp:TextBox ID="txtBroadcast" TextMode="MultiLine" Rows="5" runat="server" placeholder="群組訊息" ForeColor="Black"></asp:TextBox>
                    <asp:Button ID="btnAnnounce" runat="server" Text="廣播" CssClass="btn btn-danger" OnClick="btnAnnounce_Click" />

                    <asp:Button ID="btnClear" runat="server" Text="清除" CssClass="btn btn-danger" OnClick="btnClear_Click" />

                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
            <asp:Button ID="BackButton1" runat="server" Text="回首頁" CssClass="btn btn-danger" OnClick="BackButton1_Click"  />

        </div>
        
        
        <div id="map-canvas"></div>
    
    </form>
    
    
    <script>
        function dpclick() {
            //alert('test');
            var dpstr = document.getElementById("txtDP").value;
            //alert(document.getElementById("txtDP").value);
            var dpobj = JSON.parse(dpstr);
            for (var dp in dpobj) {
                addrToPosition(dpobj[dp].driverP, dpobj[dp].driverId);
            }

        }

        function onclickget() {
            //alert($('#lblDPosition').text());
            //var params = '{"orderno":"' + $('#lblOrder').text() + '","positiond":"' + $('#lblDPosition').text() + '"}';
            //alert('test');
            var params = '{"orderno":"' + $('#lblOrder').text() + '","driverno":"' + $('#lblDriver').text() + '","positiond":"' + $('#lblDPosition').text() + '"}';
            alert("訂單成立!");
            $.ajax({
                type: "POST",
                url: "http://192.168.1.49/WebService.asmx/ConfirmOrderd2",
                contentType: "application/json; charset=utf-8",
                async: false,
                cache: false,
                dataType: 'json',
                data: params,
                success: function (data) {
                    alert('OK');
                },
                error: function () {
                    alert('error');
                    //return false;
                },
                complete: function () {
                    //alert('complete');
                    //$.mobile.changePage('#order');
                    //return false;
                    //$res = null;

                }
            });

        }

        
    </script>
</body>
</html>
