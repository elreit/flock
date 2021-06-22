// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFetchCurrentPosition } from '../plugins/init_getcurrentlocation';
import { initRouteMap } from '../plugins/init_routemap';
import { initDestinationMap } from '../plugins/init_destinationmap';
import { initChatroomCable } from '../channels/chatroom_channel';
import { initGetHomeAddress } from '../plugins/init_gethomeaddress';
import { initStarRating } from '../plugins/init_star_rating';
import { initSweetalert } from '../plugins/init_sweetalert';
import { initPopup } from '../plugins/init_popup';


document.addEventListener('turbolinks:load', () => {
  initFetchCurrentPosition();
  initMapbox();
  initAutocomplete();
  initRouteMap();
  initDestinationMap();
  initChatroomCable();
  initGetHomeAddress();
  initStarRating();
  initSweetalert('arrived', {
    title: "Hooray you are home safe and sound!",
    icon: "success",
    buttons: {
     review: "Review your buddy",
     message: "Tell your friend you are safe"},
  }, (value) => {
    switch(value) {
      case "review":
        const reviewLink = document.getElementById('reviewlink');
        reviewLink.click();
      break;

      case "message":
        const sendMessage = document.getElementById('whatsapplink');
        const walkId = sendMessage.dataset.walkid;
        if (sendMessage) {
          sendMessage.click();
          window.location.replace(`https://www.flock525.club/walks/${walkId}/reviews/new`);
        }
      break;
    }
  });
})
