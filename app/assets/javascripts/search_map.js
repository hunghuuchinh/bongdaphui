var map;
var circles;
var markersArray = [];
var infowindow = [];

function search_map() {
  var mapProp = {
    center: new google.maps.LatLng(21.025181, 105.852413),
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  };
  var rad = 10000;

  map = new google.maps.Map(document.getElementById("map-search"),mapProp);

  search_around(rad);
}

function search_around(rad) {
  var pitches = $.parseJSON($("#map-search").attr("data-pitches"));

  google.maps.event.addListener(map,"click", function(e) {
    var lat = e.latLng.lat();
    var lng = e.latLng.lng();
    var centerRound = new google.maps.LatLng(lat, lng);
    drawCircle(centerRound, rad);

    if(pitches.length < 1){
      console.log("no pitches");
      return;
    }
    else {
      $.each(pitches, function(pitch) {
        var destPitch = new google.maps.LatLng(pitch.lat, pitch.lng);

        if(google.maps.geometry.spherical.computeDistanceBetween(centerRound, destPitch) < rad) {
          var marker = new google.maps.Marker({
            position: destPitch,
            map: map
          });

          marker.setMap(map);
          markersArray.push(marker);
          console.log(markersArray.length);
        }
      });
    }
  });
}

function drawCircle(centerRound, rad) {
  circles = new google.maps.Circle({
    strokeColor: "#2680FA",
    strokeOpacity: 0.8,
    strokeWeight: 2,
    fillColor: "#2680FA",
    fillOpacity: 0.35,
    map: map,
    center: centerRound,
    radius: rad,
  });
}
