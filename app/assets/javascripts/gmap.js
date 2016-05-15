
<script src="//maps.google.com/maps/api/js?v=3.18&sensor=false&client=&key=AIzaSyD3LW0eFL2kZufMOHkVmdB69EiTSogACxc&libraries=geometry&language=&hl=&region="></script>
<script src="//google-maps-utility-library-v3.googlecode.com/svn/tags/markerclustererplus/2.0.14/src/markerclusterer_packed.js"></script>
<script src='//google-maps-utility-library-v3.googlecode.com/svn/tags/infobox/1.1.9/src/infobox_packed.js' type='text/javascript'></script>
var map;
  map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
  getLocation();
  google.maps.event.addListener(map,'click',function(event) {
    currentPosition = new google.maps.LatLng(event.latLng.lat(), event.latLng.lng());
    marker.setPosition(currentPosition);
  });
}

function loadScript()
{
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = 'http://maps.googleapis.com/maps/api/js?sensor=false&amp;' +
            'callback=initialize';
  document.body.appendChild(script);
}

$(window).load(loadScript);

function getLocation() {
  // Check pitch co latlng chua
  if ($("#pitch_lat").val() == ""){

  // trong truong hop pitch chua co lat lng
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
  }else {
    // truong da co lat lng
    var location = new google.maps.LatLng($("#pitch_lat").val(),$("#pitch_lng").val());
    marker = new google.maps.Marker({
      position: location,
      map: map,
    });
    map.setCenter(location);
  }
}

function showPosition(position){
  var location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  marker = new google.maps.Marker({
    position: location,
    map: map,
  });

  map.setCenter(location);
  currentPosition = {lat: position.coords.latitude, lng: position.coords.longitude};
}

$(document).ready(function(){
  $("form").submit(function(){
    $("#pitch_lat").val(currentPosition.lat);
    $("#pitch_lng").val(currentPosition.lng);
  });
})

