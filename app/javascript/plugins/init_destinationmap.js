import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

// https://api.mapbox.com/optimized-trips/v1/mapbox/walking/13.388860,52.517037;13.397634,52.529407;13.418555,52.523215?source=first&access_token=pk.eyJ1IjoibWFpaGciLCJhIjoiY2ttY2g0aGhlMXc5ZzJvbGF2Z25qNjRzOSJ9.3ZTylnTR02csNdf9Sb4_Dw"

const initDestinationMap = () => {
  const mapElement = document.getElementById('destinationmap');
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    // Meeting point as a start point
    const meet = mapElement.dataset.meetPoint;
    const meetPoint = JSON.parse("[" + meet + "]");
    // User destination
    const user = mapElement.dataset.userEnd;
    const userDest = JSON.parse("[" + user + "]");
    // Buddy destination
    const buddy = mapElement.dataset.buddyEnd;
    const buddyDest = JSON.parse("[" + buddy + "]");

    // Create the map
    const destinationMap = new mapboxgl.Map({
      container: 'destinationmap',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: meetPoint,
      zoom: 13
    });

    destinationMap.on('load', function() {
      var marker = document.createElement('div');
      marker.classList = 'startpoint';

      // Create a marker for starting point
      var startMarker = new mapboxgl.Marker(marker)
        .setLngLat(meetPoint)
        .addTo(destinationMap);

      // Marker for user destination
      destinationMap.addLayer({
        id: 'userdest',
        type: 'circle',
        source: {
          type: 'geojson',
          data: {
            type: 'FeatureCollection',
            features: [{
              type: 'Feature',
              properties: {},
              geometry: {
                type: 'Point',
                coordinates: userDest
              }
            }]
          }
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#FD5C65'
        }
      });
      // Marker for buddy destination
      destinationMap.addLayer({
        id: 'buddydest',
        type: 'circle',
        source: {
          type: 'geojson',
          data: {
            type: 'FeatureCollection',
            features: [{
              type: 'Feature',
              properties: {},
              geometry: {
                type: 'Point',
                coordinates: buddyDest
              }
            }]
          }
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#FD5C65'
        }
      });

      var nothing = turf.featureCollection([]);

      destinationMap.addSource('route', {
        type: 'geojson',
        data: nothing
        });

      destinationMap.addLayer(
        {
          id: 'routeline-active',
          type: 'line',
          source: 'route',
          layout: {
          'line-join': 'round',
          'line-cap': 'round'
        },
        paint: {
          'line-color': '#3887be',
          'line-width': ['interpolate', ['linear'], ['zoom'], 12, 3, 22, 12]
        }
        },
          'waterway-label'
        );

      destinationMap.addLayer(
      {
        id: 'routearrows',
        type: 'symbol',
        source: 'route',
        layout: {
          'symbol-placement': 'line',
          'text-field': '▶',
          'text-size': [
          'interpolate',
          ['linear'],
          ['zoom'],
          12,
          24,
          22,
          60
          ],
          'symbol-spacing': [
          'interpolate',
          ['linear'],
          ['zoom'],
          12,
          30,
          22,
          160
          ],
          'text-keep-upright': false
        },
        paint: {
          'text-color': '#3887be',
          'text-halo-color': 'hsl(55, 11%, 96%)',
          'text-halo-width': 3
        }
        },
          'waterway-label'
        );
    });

    // Getting the optimised API

    function optimisedRoute(start,user,buddy) {
      var url = 'https://api.mapbox.com/optimized-trips/v1/mapbox/walking/' + start[0] + ',' + start[1] + ';' + user[0] + ',' + user[1] + ';' + buddy[0] + ',' + buddy[1] +'?source=first&geometries=geojson&steps=true&access_token='+ mapboxgl.accessToken;
      $.ajax({
          method: 'GET',
          url: url
      }).done(function (data) {
        var routeGeoJSON = turf.featureCollection([
          turf.feature(data.trips[0].geometry)
        ]);

        if (!data.trips[0]) {
          routeGeoJSON = nothing;
        } else {
        // Update the `route` source by getting the route source
        // and setting the data equal to routeGeoJSON
          destinationMap.getSource('route').setData(routeGeoJSON)
        }

        console.log(data)

        // if (destinationMap.getSource('route')) {
        //   destinationMap.getSource('route').setData(routeGeoJSON);
        // } else { // otherwise, make a new request
        //   destinationMap.addLayer({
        //     id: 'route',
        //     type: 'line',
        //     source: {
        //       type: 'geojson',
        //       data: {
        //         type: 'Feature',
        //         properties: {},
        //         geometry: {
        //           type: 'LineString',
        //           coordinates: geojson
        //         }
        //       }
        //     },
        //     layout: {
        //       'line-join': 'round',
        //       'line-cap': 'round'
        //     },
        //     paint: {
        //       'line-color': '#1F242C',
        //       'line-width': 5,
        //       'line-opacity': 0.75
        //     }
        //   });
        // }
        // add turn instructions here at the end
        var instructions = document.getElementById('instructions');
        var steps = data.trips[0].legs[0].steps;

        var tripInstructions = [];
        for (var i = 0; i < steps.length; i++) {
          tripInstructions.push('<br><li>' + steps[i].maneuver.instruction) + '</li>';
          instructions.innerHTML = '<br><span class="duration">Trip duration: ' + Math.floor(data.trips[0].duration / 60) + ' min 👟 </span>' + tripInstructions;
        }
      });
    }
      // req.send();
      optimisedRoute(meetPoint, userDest, buddyDest);
    }
  }

export { initDestinationMap };
