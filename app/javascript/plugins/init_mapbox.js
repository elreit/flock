// import mapboxgl from 'mapbox-gl';
// import 'mapbox-gl/dist/mapbox-gl.css';
//
// const initMapbox = () => {
//   const mapElement = document.getElementById('map');
//
//   if (mapElement) {
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey; # or should this say process.env.MAPBOX_API_KEY;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10'
//     });
//   }
// };
//
//
// if (mapElement) {
//   // [ ... ]
//   const markers = JSON.parse(mapElement.dataset.markers);
//   markers.forEach((marker) => {
//     new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .addTo(map);
//   });
// }
// export { initMapbox };
