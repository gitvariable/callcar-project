<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultNow.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <style>
     /* 設定地圖顯示的 css */
      html, body,form, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }     
      
    </style>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvRfqSnqG4lwB6goW_wUgAB3S2zzbRqmQ&?v=3.exp&sensor=false"></script>
    <script>
        var currentPosition;
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {

            msg.innerHTML = "Geolocation is not supported by this browser.";
        }

        function showPosition(position) {
            //alert(position.coords.latitude);
            //msg.innerHTML = "Latitude: " + position.coords.latitude +
            //"<br>Longitude: " + position.coords.longitude;
            currentPosition = new Array(position.coords.latitude, position.coords.longitude);
            //alert(currentPosition[0]);
        }



        
        function initialize() {
            
            //取得目標的經緯度
            var latlng;

            if (currentPosition != null)
                latlng = new google.maps.LatLng(currentPosition[0], currentPosition[1]);
            else
                alert('未取得定位');
            latlng = new google.maps.LatLng(22.593936, 120.308506);
         
            //設定地圖的選項
            var mapOptions = {
                zoom: 15, //地圖縮放的層級
                center: latlng, //地圖中心擺放位置
                mapTypeId:google.maps.MapTypeId.TERRAIN //地圖呈現的方式
            };

            //把地圖放在頁面的 div 裡
            var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            //宣告地圖標記選項
            var markerOptions = {
                //地圖標記位置
                position: latlng,
                //設定要套用的地圖
                map: map,
                //地圖標記要顯示的文字
                title:"My office"
            }

            //把地圖標記標示在地圖上
            var marker = new google.maps.Marker(markerOptions);


            google.maps.event.addListener(map, 'click', function (event) {
                //alert('test');

                forClick(event.latLng);

            });
        }

        function forClick(location) {
            //alert('test');
            var requestURL = 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + location.lat() + ',' + location.lng() + '&sensor=false&language=zh-tw';
            var request = new XMLHttpRequest();
            request.open('GET', requestURL);
            request.responseType = 'json';
            request.send();

            request.onload = function () {
                var addr = request.response;
                pop2(addr);
            }
        }

        function pop2(jsonObj) {
            var myAddr = document.getElementById('myAddr');

            //alert(jsonObj.results[0].formatted_address);
            myAddr.value = jsonObj.results[0].formatted_address;
            localStorage.setItem("addr", myAddr.value);
        }
      
    </script>
</head>
<body onload="initialize()">
    <form id="form1" runat="server">    
        <input id="myAddr" type="text" style="width:100%" />
        <div id="map-canvas" ></div>
    </form>
</body>
</html>
