
const initRemoveBubble = () => {
  const removeBubble = () => {
    const bubble = document.querySelector(".speech-bubble");
    if (bubble) {
      console.log(bubble);
      bubble.remove();
    }
  };
  console.log("hok");
  window.setTiemout(removeBubble, 2000);
};


export { initRemoveBubble };
