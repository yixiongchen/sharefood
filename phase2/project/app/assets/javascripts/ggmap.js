var map;


function initMap() {
map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 43.700, lng: -79.400},
  zoom: 13
});



var infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('You are here!');
      map.setCenter(pos);
    }, function() {
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
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}


/*function addMarker(pos){

    var marker = new google.maps.Marker({
    position: pos,
    map: map,
    title: 'FOOD!'
  });

  marker.setMap(map);
}
*/

function drawMap(locations, usernames, user_ids, contents, foodtypes){
  var i;
  for (i=0; i<locations.length; i++){
    var geocoder = new google.maps.Geocoder();
    var address = locations[i];
    var username = usernames[i];
    var content = contents[i];
    var foodtype = foodtypes[i];
    var user_id = user_ids[i];
    
    var contentString = '<h2><a href="/microposts/' + user_id +'">'+ username + '</a></h2>' +
    '<h2> ' + content + '</h2>' + 
    '<h2> ' + foodtype + '</h2>' + 
    '<h2> ' + address + '</h2>';
    
    var info = new google.maps.InfoWindow({
      content: contentString,
      maxWidth: 250
    });
    
    geocoder.geocode({'address' : address}, function(results, status){
      if (status === google.maps.GeocoderStatus.OK){
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
        marker.addListener('click', function() {
          info.open(map, marker);
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    })
  }
}