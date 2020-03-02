const SpeechToText = () => {
const SpeechRecognition = window.SpeechRecognition = window.webkitSpeechRecognition || window.SpeechRecognition;
const recognition = new SpeechRecognition();
const form = document.querySelector('#new_answer');
if (form) {

  recognition.start();
  recognition.onresult = (event) => {
  const vocalinput = event.results[0][0].transcript;
  console.log(vocalinput)
  const inputfield = document.getElementById('answer_content')
  inputfield.value = vocalinput;
  const btn = document.getElementById('answer');
  btn.click();
  }
};
};

export { SpeechToText };
