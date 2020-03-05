const songDelay = () => {
  const songElt = document.getElementById("song");
  console.log(songElt)
   if (songElt) {
    setTimeout(() => {
    songElt.play();
    }, 3000);
  }
}
export { songDelay };
