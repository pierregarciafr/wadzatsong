import consumer from "./consumer";

const answersContainer = document.getElementById('answers');

const buzzerElt = document.getElementById('buzzer');
const playerElt = document.getElementById('song');

const answerElt = document.getElementById('answer');
const gameElt = document.getElementById('game-container');

if (gameElt) {
  const id = gameElt.dataset.gameId;

  consumer.subscriptions.create(
    { channel: "GameChannel", id: id }, // { channel : "Game" ?, game : id, participation: id })
    {
      received(data) {
      // window.location.reload();
      console.log(data.status);

        if (data.status === "connection") {
          if (data.joinedUser) {
            // const content = `<h4>${data.joinedUser.pseudo} a rejoint la partie de ${data.hostUser.pseudo} !</h4>`;
            // // .log(`content: ${content}`);
            // gameElt.insertAdjacentHTML('beforeend',content);
          }
        };

        if (data.status === "running") {
          // window.location.reload();
          // console.log(data.content);
          // console.log('running game-container');
          gameElt.textContent = '';
          if (data) {
            gameElt.insertAdjacentHTML('beforeend',data.navbar);
            gameElt.insertAdjacentHTML('beforeend',data.content);
            console.log(data.answering_time);
            const buzz = document.getElementById("buzz");
            if (buzz) {
              buzz.addEventListener('click', () => {
                const song = document.getElementById("song");
                const time = Math.floor(song.currentTime);
                const current_time = `?current_time=${time}`;
                buzz.href = buzz.href + current_time;
              })
            }
              const audio = document.querySelector(".audio");
              const song = document.getElementById("song");
              if (song) {
                song.currentTime = audio.dataset.time;
              }
          }
        }
        if (data.status === "paused") {
          gameElt.textContent = '';
          if (data) {
            const userIdClicked = data.user.id.toString();
            // console.log('Who clicked ?');
            // console.log(userIdClicked);
            // console.log('Whose page is it ?');
            const currentUserPageIdElt = gameElt.dataset.userId
            // console.log(currentUserPageIdElt);
            if (userIdClicked !== currentUserPageIdElt) {
              gameElt.insertAdjacentHTML('beforeend',data.content);
            }
        }
      }
        if (data.status === "finished") {
          console.log('FINISHED');
          gameElt.textContent = '';
          if (data) {
            gameElt.insertAdjacentHTML('beforeend',data.content);
        }
      }
    }
  });
}

if (answersContainer) {
  const id = answersContainer.dataset.gameId;

  consumer.subscriptions.create(
    { channel: "GameChannel", id: id },
    {
      received(data) {
        if (data.status === "connection") {
          if (data.joinedUser) {
            const content = `<h4>${data.joinedUser.pseudo} a rejoint ta partie !<h4>`;
            answersContainer.insertAdjacentHTML('beforeend',content);
          }
        };
      }
    }
  );
}

