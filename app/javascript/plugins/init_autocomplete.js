import places from 'places.js';

const initAutocomplete = () => {
  //Return location in GB only

  // When creating destinations
  const startLocation = document.getElementById('destination_start_location');
  if (startLocation) {
    places({ container: startLocation, countries: ['gb']});
  }
  const endLocation = document.getElementById('destination_end_location');
  if (endLocation) {
    places({ container: endLocation, countries: ['gb']});
  }
 // When entering the meeting point
  const meetingPoint = document.getElementById('walk_meeting_point');
  if (meetingPoint) {
    places({ container: meetingPoint, countries: ['gb'] });
  }
};

export { initAutocomplete };
