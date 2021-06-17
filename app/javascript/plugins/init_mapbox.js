import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

const directions = new MapboxDirections({
  accessToken: mapboxgl.accessToken,
  unit: "metric",
  profile: "mapbox/walking",
  alternatives: false,
  geometries: "geojson",
  controls: {
    instructions: false
  },
  flyTo: false
});

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, {
    padding: 70,
    maxZoom: 15,
    duration: 0
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    // map.addControl(directions, "top-right");
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }

  const buddyTabMap = document.getElementById('mapbuddy');
  if (buddyTabMap) {
    mapboxgl.accessToken = buddyTabMap.dataset.mapboxApiKey;
    const buddyMap = new mapboxgl.Map({
      container: 'mapbuddy',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const buddyMarker = JSON.parse(buddyTabMap.dataset.marker);
    addMarkersToMap(buddyMap, buddyMarker);
    fitMapToMarkers(buddyMap, buddyMarker);
  }
};

export { initMapbox };
