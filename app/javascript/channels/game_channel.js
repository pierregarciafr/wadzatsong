import consumer from "./consumer";

const answersContainer = document.getElementById('answers');

const buzzerElt = document.getElementById('buzzer');
const playerElt = document.getElementById('song');

const answerElt = document.getElementById('answer');

if (answersContainer) {
  const id = answersContainer.dataset.gameId; // .gameId ?

  consumer.subscriptions.create(
    { channel: "GameChannel", id: id }, // { channel : "Game" ?, game : id, participation: id })
    {
      received(data) {
      // window.location.reload();
        // console.log(data.status);


        if (data.status === "connection") {

          if (data.joinedUser) {
            const content = `<p>${data.joinedUser.pseudo} a rejoint la partie de ${data.hostUser.pseudo} !</p>`;
            // .log(`content: ${content}`);
            answersContainer.insertAdjacentHTML('beforeend',content);
          }
        };

        if (data.status === "running") {
          console.log('coucou');

          // console.log(data);

          const runningContainer = document.getElementById('running-html')
          runningContainer.innerHTML = 'A BOIRE !!!';
          // console.log(data.status);
          // window.location.reload();
          // playerElt.play();

          // const p = window.location.reload();
          // $.when(p).done(function() {
          // const idPlayer = (data.joinedPlayerId).toString();
          // console.log(idPlayer);
          // const audioElt = document.getElementById(idPlayer);
          // songElt = audioElt.getElementById("song");
          // audioElt.muted = true;
          //

          // console.log(data.joinedPlayerId);
          // console.log(audioElt);
        // });
          // data.joinedPlayerId;

        };
        if (data.status === "paused") {
          console.log (data.status)
          window.location.reload();
          // window.location.reload();
          // playerElt.pause();
        };
      }
  });
}

