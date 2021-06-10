import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initDestinationMap = () => {
  const mapElement = document.getElementById('destinationmap');
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    // Meeting point as a start point
    const meet = mapElement.dataset.meetPoint;
    const meetPoint = JSON.parse("[" + meet + "]");
    // User destination
    const user = mapElement.dataset.userEnd;
    const user_dest = JSON.parse("[" + user + "]");
    // Buddy destination
    const buddy = mapElement.dataset.buddyEnd;
    const buddy_dest = JSON.parse("[" + buddy + "]");

    // Create the map
    const destinationMap = new mapboxgl.Map({
      container: 'destinationmap',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: meetPoint,
      zoom: 12
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
                coordinates: user_dest
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
                coordinates: buddy_dest
              }
            }]
          }
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#FD5C65'
        }
      });
    });

    // Getting the optimised API
  }
}
export { initDestinationMap };
