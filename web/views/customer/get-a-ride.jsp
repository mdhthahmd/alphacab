
<div id="googleMap"></div>
<script>
    var startAddress, endAddress;
    var currentPosMarker, destinationMarker, distanceInMeters;
    var startPoint = [];
    var endPoint = [];
    var area;

    function myMap() {
        var geocoder = new google.maps.Geocoder;
        var directionsService = new google.maps.DirectionsService();
        var directionsRenderer = new google.maps.DirectionsRenderer();
        var mapProp = {
            center: new google.maps.LatLng(4.1755, 73.5093),
            zoom: 15
        };
        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
        //get current location and mark it in map
        getGeoLocation(map);

        //Destination picking when tapped on map - delets old destination and adds new destination and draws route
        google.maps.event.addListener(map, 'click', function (event) {
            deleteDestinationMarker();
            placeDestinationMarker(event.latLng, map);
            calcRoute(startPoint, endPoint, directionsRenderer, directionsService, map);
            //diatance calculation
            distanceInMeters = google.maps.geometry.spherical.computeDistanceBetween(startPoint[0].getPosition(), endPoint[0].getPosition());
            //gets the name of location
            geocodeLatLng(geocoder);
            geocodeLatLng(geocoder);

            google.maps.event.addListener(currentPosMarker, 'dragend', function (event) {
                //alert('Drag end');
                for (var i = 0; i < startPoint.length; i++) {
                    startPoint[i].setMap(null);
                }
                startPoint = [];
                currentPosMarker = new google.maps.Marker({
                    position: event.latLng,
                    lable: "your current location",
                    map: map,
                    icon: 'imgs/baseline_gps_fixed_black_18dp.png',
                    draggable: true
                });
                startPoint.push(currentPosMarker);
                distanceInMeters = google.maps.geometry.spherical.computeDistanceBetween(startPoint[0].getPosition(), endPoint[0].getPosition());
                geocodeLatLng(geocoder);
                geocodeLatLng(geocoder);
                calcRoute(startPoint, endPoint, directionsRenderer, directionsService, map);
            });
        });
    }

    //outside map function 
    function calcRoute(locationstart, locationend, directionsRenderer, directionsService, map) {
        directionsRenderer.setMap(map);
        directionsRenderer.setOptions({suppressMarkers: true});
        var start = new google.maps.LatLng(locationstart[0].getPosition().lat(), locationstart[0].getPosition().lng());
        var end = new google.maps.LatLng(locationend[0].getPosition().lat(), locationend[0].getPosition().lng());
        var request = {
            origin: start,
            destination: end,
            travelMode: 'DRIVING'
        };
        directionsService.route(request, function (result, status) {
            if (status === 'OK') {
                directionsRenderer.setDirections(result);
                //disable btn
                document.getElementById("btn-book").disabled = false;
                console.log(startAddress);
                console.log(endAddress);
            }
        });
    }
    //place destination location
    function placeDestinationMarker(location, map) {
        destinationMarker = new google.maps.Marker({
            position: location,
            lable: "Destination",
            icon: 'imgs/baseline_local_taxi_black_18dp.png',
            map: map
        });
        endPoint.push(destinationMarker);
    }
    //when to move the destination - use deleteMarker
    function deleteDestinationMarker() {
        for (var i = 0; i < endPoint.length; i++) {
            endPoint[i].setMap(null);
        }
        endPoint = [];
    }

    // Try HTML5 geolocation.
    function getGeoLocation(map) {
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
                    icon: 'imgs/baseline_gps_fixed_black_18dp.png',
                    draggable: true
                });

                startPoint.push(currentPosMarker);
                infoWindow.setPosition(pos);
                infoWindow.setContent('Your current location');
                infoWindow.open(map);
                map.setCenter(pos);
            }, function () {
                handleLocationError(true, infoWindow, map.getCenter(), map);
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter(), map);
        }
    }
    //error handling for geolocation
    function handleLocationError(browserHasGeolocation, infoWindow, pos, map) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                'Error: The Geolocation service failed.' :
                'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
        currentPosMarker = new google.maps.Marker({
            position: pos,
            lable: "your current location",
            icon: 'imgs/baseline_gps_fixed_black_18dp.png',
            map: map,
            draggable: true
        });
        startPoint.push(currentPosMarker);
    }

    function myFunction() {
        window.alert("distance " + distanceInMeters + "\n" + "start " + startPoint[0].getPosition() + "\n" + "end " + endPoint[0].getPosition());
        document.getElementById("distance").value = distanceInMeters;
        document.getElementById("origin-lat").value = startPoint[0].getPosition().lat();
        document.getElementById("origin-lng").value = startPoint[0].getPosition().lng();
        document.getElementById("destination-lat").value = endPoint[0].getPosition().lat();
        document.getElementById("destination-lng").value = endPoint[0].getPosition().lng();
        document.getElementById("originAddress").value = startAddress;
        document.getElementById("destinationAddress").value = endAddress;

    }

    function geocodeLatLng(geocoder) {
        geocoder.geocode({'location': startPoint[0].getPosition()}, function (results, status) {
            if (status === 'OK') {
                if (results[0]) {
                    startAddress = results[0].formatted_address.toString();
                } else {
                    window.alert('No results found');
                }
            } else {
                window.alert('Geocoder failed due to: ' + status);
            }
        });
        geocoder.geocode({'location': endPoint[0].getPosition()}, function (results, status) {
            if (status === 'OK') {
                if (results[0]) {
                    endAddress = results[0].formatted_address.toString();
                } else {
                    window.alert('No results found');
                }
            } else {
                window.alert('Geocoder failed due to: ' + status);
            }
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAm7lXwI_sLxrwk-6TEeM6HMQ3GL-K439w&libraries=geometry&callback=myMap"></script>
<div>
    <form action="<%=request.getContextPath()%>/get-a-ride" method="post" name="bookaride">
        <button id="btn-book" onclick="myFunction()" disabled="true"  class="mdc-button mdc-button--raised">  
            <span class="mdc-button__ripple"></span> Book A Ride
        </button>
        <!--            <input type="submit" value="book ride" id="btn-book" onclick="myFunction()" disabled="true" />-->
        <input type="hidden" id="distance" name="distance"/>
        <input type="hidden" id="origin-lat" name="origin-lat"/>
        <input type="hidden" id="origin-lng" name="origin-lng"/>
        <input type="hidden" id="destination-lat" name="destination-lat"/>
        <input type="hidden" id="destination-lng" name="destination-lng"/>
        <input type="hidden" id="originAddress" name="originAddress"/>
        <input type="hidden" id="destinationAddress" name="destinationAddress"/>
        <input type="hidden" id="journeyPrice" name="journeyPrice"/>
    </form>
</div>

<style>
    #btn-book {
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

