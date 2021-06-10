import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

// Get the current location

const initRouteMap = () => {
  const mapElement = document.getElementById('routemap');
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    // getting the current location and build a map
    navigator.geolocation.getCurrentPosition((data) => {
      const routeMap = new mapboxgl.Map({
        container: 'routemap',
        style: 'mapbox://styles/mapbox/streets-v10',
        center: [data.coords.longitude, data.coords.latitude],
        zoom: 12
      });

      const start = [data.coords.longitude, data.coords.latitude];
      // new mapboxgl.Marker()
      //   .setLngLat(start_marker)
      //   .addTo(routeMap);

      // getting routes

      function getRoute(end) {
        // make a directions request using walking profile start point is current location
        var start = [data.coords.longitude, data.coords.latitude]
        var url = 'https://api.mapbox.com/directions/v5/mapbox/walking/' + start[0] + ',' + start[1] + ';' + end[0] + ',' + end[1] + '?steps=true&geometries=geojson&access_token=' + mapboxgl.accessToken;

        // make an XHR request https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
        var req = new XMLHttpRequest();
        req.open('GET', url, true);
        req.onload = function() {
          var json = JSON.parse(req.response);
          var data = json.routes[0];
          var route = data.geometry.coordinates;
          var geojson = {
            type: 'Feature',
            properties: {},
            geometry: {
              type: 'LineString',
              coordinates: route
            }
          };
          // if the route already exists on the map, reset it using setData
          if (routeMap.getSource('route')) {
            routeMap.getSource('route').setData(geojson);
          } else { // otherwise, make a new request
            routeMap.addLayer({
              id: 'route',
              type: 'line',
              source: {
                type: 'geojson',
                data: {
                  type: 'Feature',
                  properties: {},
                  geometry: {
                    type: 'LineString',
                    coordinates: geojson
                  }
                }
              },
              layout: {
                'line-join': 'round',
                'line-cap': 'round'
              },
              paint: {
                'line-color': '#1F242C',
                'line-width': 5,
                'line-opacity': 0.75
              }
            });
          }
          // add turn instructions here at the end
          var instructions = document.getElementById('instructions');
          var steps = data.legs[0].steps;

          var tripInstructions = [];
          for (var i = 0; i < steps.length; i++) {
            tripInstructions.push('<br><li>' + steps[i].maneuver.instruction) + '</li>';
            instructions.innerHTML = '<br><span class="duration">Trip duration: ' + Math.floor(data.duration / 60) + ' min 👟 </span>' + tripInstructions;
          }
        };
        req.send();
      }

      routeMap.on('load', function() {
        // make an initial directions request that
        // starts and ends at the same location
        getRoute(start);

        // Add starting point to the map
        routeMap.addLayer({
          id: 'point',
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
                  coordinates: start
                }
              }]
            }
          },
          paint: {
            'circle-radius': 10,
            'circle-color': '#3887be'
          }
        });
        // Add meet point to the map
        const meetLng = parseFloat(mapElement.dataset.meetLng);
        const meetLat = parseFloat(mapElement.dataset.meetLat);
        const meet_point = [meetLng, meetLat];
        routeMap.addLayer({
          id: 'end',
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
                  coordinates: meet_point
                }
              }]
            }
          },
          paint: {
            'circle-radius': 10,
            'circle-color': '#FD5C65'
          }
        });
        getRoute(meet_point);
      });
    });
  }
};

export {
  initRouteMap
};
