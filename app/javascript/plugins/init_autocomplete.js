import places from 'places.js';

const initAutocomplete = () => {
  // When creating destinations
  const startLocation = document.getElementById('destination_start_location');
  if (startLocation) {
    places({ container: startLocation });
  }
  const endLocation = document.getElementById('destination_end_location');
  if (endLocation) {
    places({ container: endLocation });
  }
 // When entering the meeting point
  const meetingPoint = document.getElementById('walk_meeting_point');
  if (meetingPoint) {
    places({ container: meetingPoint });
  }
};

export { initAutocomplete };
