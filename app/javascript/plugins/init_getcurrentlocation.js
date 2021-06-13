function success(pos) {
  const crd = pos.coords;
  const lat = crd.latitude;
  const lng = crd.longitude;

  $.ajax({
   type: "GET",
   url: '/coords',
   data: {'lat': lat, 'lng': lng},
   contentType: "application/json; charset=utf-8",
   dataType: "html",
   success: function (data) {
     const doc = $($.parseHTML(data)).find("#coords");
     console.log("here" + doc);
   }
  });
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
