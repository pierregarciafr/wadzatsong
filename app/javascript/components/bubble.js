
const removeBubbleGood = () => {
  console.log("coucou good");
  const bubble = document.querySelector(".speech-bubble-good-answer");
  if (bubble) {
    console.log(bubble);
    setTimeout(() => {
      bubble.classList.add('zoomOut');
    }, 3000);
  }
};

const removeBubbleBad = () => {
  console.log("coucou bad");
  const bubble = document.querySelector(".speech-bubble-bad-answer");
  if (bubble) {
    console.log(bubble);
    setTimeout(() => {
      bubble.classList.add('zoomOut');
    }, 3000);
  }
};

export { removeBubbleGood };
export { removeBubbleBad };
