function success(pos) {
  const crd = pos.coords;
  console.log('Your current position is:');
  console.log(`Latitude : ${crd.latitude}`);
  console.log(`Longitude: ${crd.longitude}`);
}

function error(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
}


const initFetchCurrentPosition = (event) => {
  const getCurrentLocation = document.getElementById('find-me');
  if (getCurrentLocation) {
    getCurrentLocation.addEventListener('click', () => {
      navigator.geolocation.getCurrentPosition(success, error);
    });
  }
};

export { initFetchCurrentPosition };
