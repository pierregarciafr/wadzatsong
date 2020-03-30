// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import "bootstrap";
import { confetti } from '../components/confettis';
import { removeBubbleGood } from '../components/bubble';
import { removeBubbleBad } from '../components/bubble';
import { SpeechToText } from '../components/speechtotext';
import { countDown } from '../components/countDown';
import { songDelay } from '../components/songDelay';
import { skipSong } from '../components/skipSong';
import { flashSong } from '../components/flashSong';
// import { getCode } from '../plugins/fetch';


const countDownElt = document.getElementById("countdown");

confetti();

document.addEventListener('turbolinks:load', () => {
  confetti();
  flashSong();
  removeBubbleGood();
  removeBubbleBad();
  if (countDownElt) {
    countDown();
  }
  songDelay();

  const buzz = document.getElementById("buzz");
  if (buzz) {
    buzz.addEventListener('click', () => {
    const song = document.getElementById("song");
    const time = parseFloat((song.currentTime).toFixed(2));
    const current_time = `?current_time=${time}`;
    buzz.href = buzz.href + current_time;
    })
  }

  const audio = document.querySelector(".audio");
  const song = document.getElementById("song");
  if (song) {
    song.currentTime = audio.dataset.time;
  }
  skipSong();
})
  SpeechToText ();

