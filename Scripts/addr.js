//alert('testOut');
function startAddr() {

    //alert('testIn');
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(getAddr);
    } else {

        //msg.innerHTML = "Geolocation is not supported by this browser.";
    }
}

    function getAddr(position) {
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;


    var requestURL = 'http://maps.googleapis.com/maps/api/geocode/json?latlng='+lat+','+lon+'&sensor=false&language=zh-tw';
    var request = new XMLHttpRequest();
    request.open('GET', requestURL);
    request.responseType = 'json';
    request.send();

    request.onload = function () {
        var addr = request.response;
        populateHeader(addr);
    }
}

function populateHeader(jsonObj) {
    //var myH1 = document.createElement('h1');
    //myH1.textContent = jsonObj;
    var txtAddr = document.getElementById("txtAddr");
    $('#txtAddr').val(jsonObj.results[0].formatted_address);
    //var data = JSON.stringify(jsonObj);
    //test.innerText = data;
    //header.appendChild(myH1);           
}
