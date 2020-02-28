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
        console.log(id);
        // console.log(data.status);

        if (data.status === "connection") {
          const content = '<p>' + data.user + ' a rejoint la partie !</p>';
          answersContainer.insertAdjacentHTML('beforeend',content);
        };

        if (data.status === "running") {

          // const p = window.location.reload();
          // $.when(p).done(function() {
          const idPlayer = (data.joinedPlayerId).toString();
          console.log(idPlayer);
          const audioElt = document.getElementById(idPlayer);
          // songElt = audioElt.getElementById("song");
          // audioElt.muted = true;
          //

          console.log(data.joinedPlayerId);
          console.log(audioElt);
        // });
          // data.joinedPlayerId;

        };
        if (data.status === "paused") {
          // console.log (data.status)
          window.location.reload();
        };
      }
  });
}

