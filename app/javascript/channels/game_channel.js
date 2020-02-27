import consumer from "./consumer";

const answersContainer = document.getElementById('answers');

const buzzerElt = document.getElementById('buzzer');
const clickBuzzer = buzzerElt.addEventListener('click', (event) => {
  window.location.reload();
});)
const answerElt = document.getElementById('answer');


if (answersContainer) {
  const id = answersContainer.dataset.gameId; // .gameId ?
  consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
    received(data) {

      window.location.reload();

      // answersContainer.insertAdjacentHTML('beforeend', data);
    }
  });
}

