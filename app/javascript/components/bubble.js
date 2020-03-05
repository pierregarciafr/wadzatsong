
const removeBubbleGood = () => {
  const bubble = document.querySelector(".speech-bubble-good-answer");
  if (bubble) {
    setTimeout(() => {
      bubble.classList.add('zoomOut');
    }, 3000);
  }
};

const removeBubbleBad = () => {
  const bubble = document.querySelector(".speech-bubble-bad-answer");
  if (bubble) {
    setTimeout(() => {
      bubble.classList.add('zoomOut');
    }, 3000);
  }
};

export { removeBubbleGood };
export { removeBubbleBad };
