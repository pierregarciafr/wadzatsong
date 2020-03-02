const removeBubble = () => {
  const bubble = document.querySelector(".speech-bubble");
  if (bubble) {
    setTimeout(() => {
      bubble.classList.add('zoomOut');
    }, 3000);
  }
};


export { removeBubble };
