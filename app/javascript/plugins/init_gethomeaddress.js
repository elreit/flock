const initGetHomeAddress = (event) => {
  const homeButton = document.getElementById('home-address');
  const homeAddress = homeButton.dataset.home;
  if (homeButton) {
    homeButton.addEventListener('click', () => {
      document.getElementById("destination_end_location").value = homeAddress;
    });
  }
};

export { initGetHomeAddress };
