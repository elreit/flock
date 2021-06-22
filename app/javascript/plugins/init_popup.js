const openPopUpButtons = document.querySelectorAll('[data-pop-up-target')
const closePopUpButtons = document.querySelectorAll('[data-close-button')
const overlay = document.getElementById('overlay')

openPopUpButtons.forEach(button => {
  button.addEventListener('click', () => {
    const popUp = document.querySelector(button.dataset.popUpTarget)
    openPopUp(popUp)
  })
})

overlay.addEventListener('click', () => {
  const popUps = document.querySelectorAll('.pop-up.active')
  popUps.forEach(popUp => {
    closePopUp(popUp)
  })
})

closePopUpButtons.forEach(button => {
  button.addEventListener('click', () => {
    const popUp = button.closest('.pop-up')
    closePopUp(popUp)
  })
})

function openPopUp(popUp) {
  if (popUp == null)
    return
  popUp.classList.add('active')
  overlay.classList.add('active')
}

function closePopUp(popUp) {
  if (popUp == null)
    return
  popUp.classList.remove('active')
  overlay.classList.remove('active')
}

