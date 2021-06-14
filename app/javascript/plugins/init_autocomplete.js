import places from 'places.js';

const initAutocomplete = () => {
  //Return location in GB only

  // When creating destinations
  const startLocation = document.getElementById('destination_start_location');
  if (startLocation) {
    places({ container: startLocation }).configure({
    postcodeSearch: true,
    countries: ['gb'],
    language: 'en' });
  }
  const endLocation = document.getElementById('destination_end_location');
  if (endLocation) {
    places({ container: endLocation }).configure({
    postcodeSearch: true,
    countries: ['gb'],
    language: 'en' });
  }
 // When entering the meeting point
  const meetingPoint = document.getElementById('walk_meeting_point');
  if (meetingPoint) {
    places({ container: meetingPoint }).configure({
    postcodeSearch: true,
    countries: ['gb'],
    language: 'en' });
  }
};

export { initAutocomplete };
