const skipSong = () => {
  const song = document.getElementById("song");
  const ghostForm = document.querySelector('#ghost_new_answer');
  if (ghostForm){
    if (song) {
      song.addEventListener("ended", () => {
        const ghostInputField = document.getElementById('ghost_answer_content');
        const answer = document.querySelector('.ghost');
        ghostInputField.value = answer.dataset.answer;
        console.log(ghostInputField.value);
        const ghostBtn = document.getElementById('ghost_answer');
        ghostBtn.click();
      })
    }
  }
}

export { skipSong };


