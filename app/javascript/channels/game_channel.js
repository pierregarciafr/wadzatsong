import consumer from "./consumer";

const answersContainer = document.getElementById('answers');

const buzzerElt = document.getElementById('buzzer');
const playerElt = document.getElementById('song');

const answerElt = document.getElementById('answer');

if (answersContainer) {
  const id = answersContainer.dataset.gameId; // .gameId ?

  consumer.subscriptions.create(
    { channel: "GameChannel", id: id },
    {
      received(data) {
      // window.location.reload();
        console.log(data)
        if (data === "pause" ) {
        }
      }
  });
}

