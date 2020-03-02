
const initRemoveBubble = () => {
  const removeBubble = () => {
    const bubble = document.querySelector(".speech-bubble");
    if (bubble) {
      console.log(bubble);
      bubble.remove();
    }
  };
  console.log("hok");
  window.setTimeout(removeBubble, 2000);
};


export { initRemoveBubble };
