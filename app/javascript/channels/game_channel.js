import consumer from "./consumer";
import { confetti } from '../components/confettis';
import { countDown } from '../components/countDown';
import { songDelay } from '../components/songDelay';

const answersContainer = document.getElementById('answers');

const buzzerElt = document.getElementById('buzzer');
const playerElt = document.getElementById('song');

const answerElt = document.getElementById('answer');
const gameElt = document.getElementById('game-container');

if (gameElt) {
  const id = gameElt.dataset.gameId;

  consumer.subscriptions.create(
    { channel: "GameChannel", id: id },
    {
      received(data) {
      // window.location.reload();
      console.log(data.status);

        if (data.status === "connection") {
          if (data.joinedUser) {
          }
        };

        if (data.status === "running") {
          gameElt.textContent = '';
          if (data) {
            gameElt.insertAdjacentHTML('beforeend',data.navbar);
            gameElt.insertAdjacentHTML('beforeend',data.content);


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

            // const songDelay = () => {
            const songElt = document.getElementById("song");
              if (songElt) {
                setTimeout(() => {
                songElt.play();
                }, 3000);
              }
            // }


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


            const three = document.getElementById("3");
            const two = document.getElementById("2");
            const one = document.getElementById("1");
            const buzzImgElt = document.getElementById("buzz-img");
            const consigneElt = document.getElementById('consigne');

            // const countDown = () => {
            // buzzImgElt.style.visibility = "hidden";
            if (three) {
              setTimeout(() => {
                three.classList.remove('d-block');
                three.classList.add('d-none');
                two.classList.add('d-block');
                setTimeout(() => {
                  two.classList.remove('d-block');
                  two.classList.add('d-none');
                  one.classList.add('d-block');
                  setTimeout (() => {
                    one.classList.remove('d-block');
                    one.classList.add('d-none');
                    buzzImgElt.style.visibility = "visible";
                    consigneElt.style.visibility = "visible";

                  }, 1000);
                }, 1000);
              }, 1000);
            }
            // }
          }
        }
        if (data.status === "paused") {
          gameElt.textContent = '';
          if (data) {
            const userIdClicked = data.user.id.toString();
            const currentUserPageIdElt = gameElt.dataset.userId;
            // console.log('Who clicked ?');
            // console.log(userIdClicked);
            // console.log('Whose page is it ?');
            // console.log(currentUserPageIdElt);
            if (userIdClicked !== currentUserPageIdElt) {
              gameElt.insertAdjacentHTML('beforeend',data.content);
            }
        }
      }
      if (data.status === "finished") {
        gameElt.textContent = '';
        if (data) {
          console.log(data);
          // const userIdClicked = data.user.id.toString();
          const currentUserPageIdElt = gameElt.dataset.userId;
          gameElt.insertAdjacentHTML('beforeend',data.content);
          confetti();

          document.querySelectorAll('.user-result').forEach((user) => {
            if (user.dataset.user == currentUserPageIdElt){
              user.classList.add("green")
             }
            else {
              user.classList.remove("green")
            }
           })
          // if (userIdClicked !== currentUserPageIdElt) {
          //  // document.querySelector('.replay').classList.add('d-none');

          // }
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
            const content = `<h5>${data.joinedUser.pseudo} a rejoint ta partie !<h5>`;
            answersContainer.insertAdjacentHTML('beforeend',content);
          }
        };
      }
    }
  );
}

