<%@page import="java.util.ArrayList"%>
<%@page import="com.alphacab.model.JourneyBean"%>

<h1 class="mdc-typography--headline3" >Select a Journey</h1>
<% if (request.getSession().getAttribute("take-a-journey") != null) { %>
<%ArrayList<JourneyBean> journeys = (ArrayList<JourneyBean>) request.getSession().getAttribute("take-a-journey");%>
<input type="hidden" value="<%=journeys.get(0).getP_Lattitude()%>" id="pickup-Lat"/>
<input type="hidden" value="<%=journeys.get(0).getP_Longitude()%>" id="pickup-Lng"/>
<input type="hidden" value="<%=journeys.get(0).getD_Lattitude()%>" id="destination-lat"/>
<input type="hidden" value="<%=journeys.get(0).getD_Longitude()%>" id="destination-lng"/>
<%}%>

<div id="googleMap" style="width:100%;height:400px;"></div>
<script>
    var customerCurrentPosMarker, customerDestinationMarker, distanceInMeters;
    var startPoint = [];
    var endPoint = [];
    var pickupLat = parseFloat(document.getElementById('pickup-Lat').value);
    var pickupLng = parseFloat(document.getElementById('pickup-Lng').value);
    var destinationLat = parseFloat(document.getElementById('destination-lat').value);
    var destinationLng = parseFloat(document.getElementById('destination-lng').value);

    var pickupLocation = {lat: pickupLat, lng: pickupLng};
    var destintionLocation = {lat: destinationLat, lng: destinationLng};

    function myMap() {
        var geocoder = new google.maps.Geocoder;
        var directionsService = new google.maps.DirectionsService();
        var directionsRenderer = new google.maps.DirectionsRenderer();
        var c_dDirectionsService = new google.maps.DirectionsService();
        var c_dDdirectionsRenderer = new google.maps.DirectionsRenderer();

        var mapProp = {
            center: new google.maps.LatLng(4.1755, 73.5093),
            zoom: 15
        };
        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

        infoWindowPickup = new google.maps.InfoWindow;
        var p_lable = 'pickup';
        var p_icon = 'imgs/baseline_emoji_people_black_18dp.png';
        placeMarker(pickupLocation, map, customerCurrentPosMarker, p_lable, p_icon, infoWindowPickup);

        infoWindowDest = new google.maps.InfoWindow;
        var d_lable = 'destination';
        var d_icon = 'imgs/baseline_store_mall_directory_black_18dp.png';
        placeMarker(destintionLocation, map, customerDestinationMarker, d_lable, d_icon, infoWindowDest);

        getGeoLocation(map, directionsRenderer, directionsService, c_dDdirectionsRenderer, c_dDirectionsService);
    }

    function calcRoute(directionsRenderer, directionsService, map, start, end) {
        directionsRenderer.setMap(map);
        directionsRenderer.setOptions({suppressMarkers: true});
        var request = {
            origin: start,
            destination: end,
            travelMode: 'DRIVING'
        };
        directionsService.route(request, function (result, status) {
            if (status === 'OK') {
                directionsRenderer.setDirections(result);
                //disable btn
            }
        });
    }

    function calcRouteCustToDest(directionsRenderer, directionsService, map, start, end) {
        directionsRenderer.setMap(map);
        directionsRenderer.setOptions({suppressMarkers: true});
        directionsRenderer.setOptions({polylineOptions: {strokeColor: 'red'}});
        var request = {
            origin: start,
            destination: end,
            travelMode: 'DRIVING'
        };
        directionsService.route(request, function (result, status) {
            if (status === 'OK') {
                directionsRenderer.setDirections(result);
                //disable btn
            }
        });
    }

    function placeMarker(location, map, markerName, markerLable, icon, infoWindowMarker) {
        markerName = new google.maps.Marker({
            position: location,
            lable: markerLable,
            icon: icon,
            map: map
        });

        infoWindowMarker.setPosition(location);
        infoWindowMarker.setContent(markerLable);
        infoWindowMarker.open(map);
        map.setCenter(location);
    }
    // Try HTML5 geolocation.
    function getGeoLocation(map, directionsRenderer, directionsService, cust_destDirectionsRenderer, cust_destDirectionsService) {
        infoWindow = new google.maps.InfoWindow;
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                currentPosMarker = new google.maps.Marker({
                    position: pos,
                    lable: "your current location",
                    map: map,
                    icon: 'imgs/baseline_local_taxi_black_18dp.png'
                });

                infoWindow.setPosition(pos);
                infoWindow.setContent('Your current location');
                infoWindow.open(map);
                map.setCenter(pos);
                calcRoute(directionsRenderer, directionsService, map, pos, pickupLocation);
                calcRouteCustToDest(cust_destDirectionsRenderer, cust_destDirectionsService, map, pickupLocation, destintionLocation);
            }, function () {
                handleLocationError(true, infoWindow, map.getCenter(), map, directionsRenderer, directionsService);
            });
        } else {

            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter(), map);
        }
    }
    //error handling for geolocation
    function handleLocationError(browserHasGeolocation, infoWindow, pos, map, directionsRenderer, directionsService) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                'Error: The Geolocation service failed.' :
                'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
        calcRouteCustToDest(directionsRenderer, directionsService, map, pickupLocation, destintionLocation);
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAm7lXwI_sLxrwk-6TEeM6HMQ3GL-K439w&libraries=geometry&callback=myMap"></script>

<% if (request.getSession().getAttribute("take-a-journey") != null) { %>
<%ArrayList<JourneyBean> journeys = (ArrayList<JourneyBean>) request.getSession().getAttribute("take-a-journey");%>
<div>
    <form action="<%=request.getContextPath()%>/end-trip" method="post" name="bookaride">
        <input type="hidden" name="journeyID" value="<%=journeys.get(0).getJourneyID()%>"/>
        <button id="btn-ride" class="mdc-button mdc-button--raised">  
            <span class="mdc-button__ripple"></span> End Trip
        </button>
   </form>
</div>
<%}%>

<style>
    #btn-ride {
        position: absolute;
        bottom: 10%;
        left: 50%;
        height: 48px;
        width: 256px;
        transform: translateX(-50%);

    }

    #googleMap {
        position: absolute;
        top: 0;
        left: 0;
        width: 100% !important;
        height: 100% !important;
    }
</style>