const initUserDashboard = () => {
  //Return location in GB only

  // When creating destinations
  const buttons = document.querySelectorAll('stayinpage');
  if (buttons) {
    for (let i=0; i < buttons.length; i++) {
      buttons[i].addEventListener('click', () => {
        const active = document.getElementById('activetab');
        if (active) {
          active.classList.remove('active');
          const incoming = document.getElementById('incomingtab');
          if (incoming) {
            incoming.classList.add('active');
          }
        }
      });
    }
  }
};

export { initUserDashboard };
