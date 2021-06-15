import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

function optimisedRoute(start,first,second,destinationMap) {
  var url = 'https://api.mapbox.com/optimized-trips/v1/mapbox/walking/' + start[0] + ',' + start[1] + ';' + first[0] + ',' + first[1] + ';' + second[0] + ',' + second[1] +'?source=first&destination=last&roundtrip=false&geometries=geojson&steps=true&access_token='+ mapboxgl.accessToken;
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
      destinationMap.getSource('routeHome').setData(routeGeoJSON);
    }

    // if (destinationMap.getSource('routeHome')) {
    //   destinationMap.getSource('routeHome').setData(routeGeoJSON);
    // } else { // otherwise, make a new request
    //   destinationMap.addLayer({
    //     id: 'routeHome',
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
    // add turn instructions here at the end
      var instructions = document.getElementById('instructions');
      var steps = data.trips[0].legs[0].steps;
      console.log(data.trips[0]);

      var tripInstructions = [];
      for (var i = 0; i < steps.length; i++) {
        tripInstructions.push('<br><li>' + steps[i].maneuver.instruction) + '</li>';
        instructions.innerHTML = '<br><span class="duration">Trip duration: ' + Math.floor(data.trips[0].duration / 60) + ' min 👟 </span>' + tripInstructions;
      }
    });
    // }
  // });
}

const initDestinationMap = () => {
  const mapElement = document.getElementById('destinationmap');
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    // Meeting point as a start point
    const meet = mapElement.dataset.meetPoint;
    const meetPoint = JSON.parse("[" + meet + "]");
    // 1st destination
    const first = mapElement.dataset.firstEnd;
    const firstDest = JSON.parse("[" + first + "]");
    // 2nd destination
    const second = mapElement.dataset.secondEnd;
    const secondDest = JSON.parse("[" + second + "]");

    // Create the map
    const destinationMap = new mapboxgl.Map({
      container: 'destinationmap',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: meetPoint,
      zoom: 12
    });

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
      destinationMap.triggerRepaint();

    // Return `true` to let the map know that the image was updated.
      return true;
      }
    };

    // adding layers to the map

    destinationMap.on('load', function() {
      destinationMap.addImage('pulsing-dot', pulsingDot, { pixelRatio: 2 });

      // Create a marker for starting point
      destinationMap.addLayer({
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
                  coordinates: meetPoint
                }
              }]
            }
          },
          layout: {
            'icon-image': 'pulsing-dot',
            'text-field': 'Meet here',
            'text-size': 12
          }
        });

      // Marker for first destination
      destinationMap.addLayer({
        id: 'firstdest',
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
                coordinates: firstDest
              }
            }]
          }
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#FD5C65'
        }
      });
      // mark 1 on the map for the first destination

      destinationMap.addLayer({
        id: 'firstmarker',
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
                coordinates: firstDest
              }
            }]
          }
        },
        layout: {
          'text-field': '1',
          'text-size': 12
        }
      });
      // Marker for second destination
      destinationMap.addLayer({
        id: 'seconddest',
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
                coordinates: secondDest
              }
            }]
          }
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#FD5C65'
        }
      });

      // mark 2 on the map for the second dest

      destinationMap.addLayer({
        id: 'secondmarker',
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
                coordinates: secondDest
              }
            }]
          }
        },
        layout: {
          'text-field': '2',
          'text-size': 12
        }
      });

      var nothing = turf.featureCollection([]);

      destinationMap.addSource('routeHome', {
        type: 'geojson',
        data: nothing
      });

      destinationMap.addLayer(
        {
          id: 'routeline-active',
          type: 'line',
          source: 'routeHome',
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
        source: 'routeHome',
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
          optimisedRoute(meetPoint, firstDest, secondDest, destinationMap);
    });

    // Getting the optimised API



    }
  }

//}



export { initDestinationMap };
