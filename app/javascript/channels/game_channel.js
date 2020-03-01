import consumer from "./consumer";

const answersContainer = document.getElementById('answers');

const buzzerElt = document.getElementById('buzzer');
const playerElt = document.getElementById('song');

const answerElt = document.getElementById('answer');
const gameElt = document.getElementById('game-container');

if (gameElt) {
  const id = gameElt.dataset.gameId; // .gameId ?

  consumer.subscriptions.create(
    { channel: "GameChannel", id: id }, // { channel : "Game" ?, game : id, participation: id })
    {
      received(data) {
      // window.location.reload();
      console.log(data.status);

        if (data.status === "connection") {
          console.log('connection game-container');
          const testElt = document.getElementById('test');
          testElt.textContent = 'TEST';

          if (data.joinedUser) {
            // const content = `<h4>${data.joinedUser.pseudo} a rejoint la partie de ${data.hostUser.pseudo} !</h4>`;
            // // .log(`content: ${content}`);
            // gameElt.insertAdjacentHTML('beforeend',content);
          }
        };

        if (data.status === "running") {
          // window.location.reload();
          console.log(data.content);
          console.log('running game-container');
          gameElt.textContent = '';
          if (data) {
            gameElt.insertAdjacentHTML('beforeend',data.content);

            // const content = `<h4>${data.joinedUser.pseudo} a rejoint la partie de ${data.hostUser.pseudo} !</h4>`;
            // .log(`content: ${content}`);
            //gameElt.insertAdjacentHTML('afterbegin',data);
          }
        }
        if (data.status === "paused") {
          // window.location.reload();
          console.log(data.content);
          console.log('paused game-container');
          // gameElt.textContent = '';
          if (data) {
            gameElt.insertAdjacentHTML('beforeend',data.content);
        }
      }
    }
  });
}


if (answersContainer) {
  const id = answersContainer.dataset.gameId; // .gameId ?

  consumer.subscriptions.create(
    { channel: "GameChannel", id: id }, // { channel : "Game" ?, game : id, participation: id })
    {
      received(data) {
      // window.location.reload();
        // console.log(data.status);

        if (data.status === "connection") {
                    console.log('connection answers');

          if (data.joinedUser) {
            const content = `<h4>${data.joinedUser.pseudo} a rejoint la partie de ${data.hostUser.pseudo} !</h4>`;
            // .log(`content: ${content}`);
            answersContainer.insertAdjacentHTML('beforeend',content);
          }
        };

        if (data.status === "running") {
        //   window.location.reload();
          console.log(data)
          console.log('running answers');

        //   console.log(data);

        //   // const runningContainer = document.getElementById('game-running-track')
        //   // runningContainer.innerHTML = '';

        };
        if (data.status === "paused") {
          console.log(data)
          console.log('paused answers');
          // window.location.reload();
          // playerElt.pause();
        };
      }
    }
  );
}

