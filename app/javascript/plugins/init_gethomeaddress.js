const initGetHomeAddress = (event) => {
  const homeButton = document.getElementById('home-address');
  if (homeButton) {
    const homeAddress = homeButton.dataset.home;
    homeButton.addEventListener('click', () => {
      document.getElementById("destination_end_location").value = homeAddress;
    });
  }
};

export { initGetHomeAddress };
