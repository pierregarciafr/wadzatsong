


const SpeechToText = () => {
const SpeechRecognition = window.SpeechRecognition = window.webkitSpeechRecognition || window.SpeechRecognition;
const recognition = new SpeechRecognition();
const icon = document.querySelector('i.fa.fa-microphone')
// let paragraph = document.createElement('p');
// let container = document.querySelector('.text-box');
// container.appendChild(paragraph);
icon.addEventListener('click', () => {
dictate();
});

const dictate = () => {
  recognition.start();
  recognition.onresult = (event) => {
  const vocalinput = event.results[0][0].transcript;
  console.log(vocalinput)
  const tracktitle = document.getElementById('track-title').textContent;
  console.log(tracktitle);
  console.log(vocalinput == tracktitle)
    if (vocalinput === tracktitle) {
      console.log('c bon');
    } else {
      console.log('c pas bon');
    }
  }
};
};

export { SpeechToText };
