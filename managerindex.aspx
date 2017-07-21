<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerindex.aspx.cs" Inherits="managerindex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
   
    <title>管理者頁面</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/manager.css" rel="stylesheet" />

    <%-- 地圖所需的大小 --%>
    <style>
        /* Always set the map height explicitly to define the size of the div
        * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
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
                        <li><asp:Button ID="Buttonlogout" runat="server" Text="登出" OnClick="Buttonlogout_Click" /></li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>
            </nav>
        </div>

    




   </form>

    <br />
    <br />
    <br />
    <div id="map" style="width:1600px;height:600px;" class="center-block"></div>

     <script>
        // Note: This example requires that you consent to location sharing when
        // prompted by your browser. If you see the error "The Geolocation service
        // failed.", it means you probably did not give permission for the browser to
        // locate you.

        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                //center: { lat: 0.0, lng: 0.0 },
                center: { lat: 22.593936, lng: 120.308506 },
                zoom: 18
            });
            var infoWindow = new google.maps.InfoWindow({ map: map });

            // Try HTML5 geolocation.
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };

                    infoWindow.setPosition(pos);
                    infoWindow.setContent('我的位置');
                    map.setCenter(pos);
                }, function () {
                    handleLocationError(true, infoWindow, map.getCenter());
                });
            } else {
                // Browser doesn't support Geolocation
                handleLocationError(false, infoWindow, map.getCenter());
            }
        }

        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(browserHasGeolocation ?
                                  '車隊中心' :
                                  'Error: Your browser doesn\'t support geolocation.');
        }





    </script>




         <%-- 金鑰設定 --%>
     <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqGXAcCMJO4IDxDsmHdMLbPmzdDKvdNmM&callback=initMap">
    </script>
 
</body>
</html>
