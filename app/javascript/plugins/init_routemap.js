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
        zoom: 13
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

      // function to create an animated icon on the map
      var size = 150;
      // to draw a pulsing dot icon on the map.
      var pulsingDot = {
        width: size,
        height: size,
        data: new Uint8Array(size * size * 4),

      // When the layer is added to the map,
      // get the rendering context for the map canvas.
        onAdd: function () {
        var canvas = document.createElement('canvas');
        canvas.width = this.width;
        canvas.height = this.height;
        this.context = canvas.getContext('2d');
      },

      // Call once before every frame where the icon will be used.
        render: function () {
        var duration = 1000;
        var t = (performance.now() % duration) / duration;

        var radius = (size / 2) * 0.3;
        var outerRadius = (size / 2) * 0.7 * t + radius;
        var context = this.context;

      // Draw the outer circle.
        context.clearRect(0, 0, this.width, this.height);
        context.beginPath();
        context.arc(
          this.width / 2,
          this.height / 2,
          outerRadius,
          0,
          Math.PI * 2
        );
        context.fillStyle = 'rgba(255, 200, 200,' + (1 - t) + ')';
        context.fill();

      // Draw the inner circle.
        context.beginPath();
        context.arc(
        this.width / 2,
        this.height / 2,
        radius,
        0,
        Math.PI * 2
        );
        context.fillStyle = 'rgba(255, 100, 100, 1)';
        context.strokeStyle = 'white';
        context.lineWidth = 2 + 4 * (1 - t);
        context.fill();
        context.stroke();

      // Update this image's data with data from the canvas.
        this.data = context.getImageData(
          0,
          0,
          this.width,
          this.height
        ).data;

        // Continuously repaint the map, resulting
        // in the smooth animation of the dot.
        routeMap.triggerRepaint();

      // Return `true` to let the map know that the image was updated.
        return true;
        }
      };

      routeMap.on('load', function() {
        routeMap.addImage('pulsing-dot', pulsingDot, { pixelRatio: 2 });
        routeMap.loadImage(
          'https://res.cloudinary.com/diq781xvq/image/upload/v1623699345/movie-bookmark-app/location_map_pin_mark_icon_148684_twkghw.png',
          function (error, image) {
            if (error) throw error;
            routeMap.addImage('destination', image);
            // starts and ends at the same location
            getRoute(start);

            // Add starting point to the map
            routeMap.addLayer({
              id: 'point',
              type: 'symbol',
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
              layout: {
                'icon-image': 'pulsing-dot'
              }
            });
            // Add meet point to the map
            const meetLng = parseFloat(mapElement.dataset.meetLng);
            const meetLat = parseFloat(mapElement.dataset.meetLat);
            const meet_point = [meetLng, meetLat];
            routeMap.addLayer({
              id: 'end',
              type: 'symbol',
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
              layout: {
                'icon-image': 'destination',
                'icon-allow-overlap': true,
                'symbol-z-order': 'viewport-y'
              },
              properties: {
                'meet-point': 'Meetpoint'
              }
            });
            getRoute(meet_point);
          }
        );
      });
    });
  }
};

export {
  initRouteMap
};
