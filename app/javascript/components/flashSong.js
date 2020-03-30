const flashSong = () => {
  const guessedSongs = document.querySelectorAll(".guessed");
  if (guessedSongs) {
    guessedSongs.forEach((item) => {
    item.classList.remove('flashit');
    const lastItem = guessedSongs[guessedSongs.length - 1];
    setTimeout(() => {
      lastItem.classList.add('flashit');
    }, 3000);
    });
  }
};


export { flashSong };
