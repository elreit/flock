const initSendWhatsApp = () => {
  const arrivedButton = document.getElementById('arrived');
  if (arrivedButton) {
    var number = arrivedButton.dataset.number;
    var text = arrivedButton.dataset.text;
    arrivedButton.addEventListener('click', () => {
      window.open('https://api.whatsapp.com/send?phone=' + number + '&text=%20' + text, '_blank');
    });
  }
}

export { initSendWhatsApp };
