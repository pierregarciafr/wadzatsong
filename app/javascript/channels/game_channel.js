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
          const testElt = document.getElementById('test');
          testElt.textContent = '';

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
            console.log('navbar:')
            console.log(data.navbar)
            gameElt.insertAdjacentHTML('beforeend',data.navbar);
            gameElt.insertAdjacentHTML('beforeend',data.content);
            console.log(data.current_track);
            // await new Promise(r => setTimeout(r, 2000));
            // const content = `<h4>${data.joinedUser.pseudo} a rejoint la partie de ${data.hostUser.pseudo} !</h4>`;
            // .log(`content: ${content}`);
            //gameElt.insertAdjacentHTML('afterbegin',data);
          }
        }
        if (data.status === "paused") {
          // window.location.reload();
          gameElt.textContent = '';
          if (data) {
            gameElt.insertAdjacentHTML('beforeend',data.content);
        }
      }
        if (data.status === "finished") {
          // window.location.reload();
          console.log('FINISHED');
          gameElt.textContent = '';
          if (data) {
            gameElt.insertAdjacentHTML('beforeend',data.content);
        }
      }


    }
  });
}


// if (answersContainer) {
//   const id = answersContainer.dataset.gameId; // .gameId ?

//   consumer.subscriptions.create(
//     { channel: "GameChannel", id: id }, // { channel : "Game" ?, game : id, participation: id })
//     {
//       received(data) {
//       // window.location.reload();
//         // console.log(data.status);

//         if (data.status === "connection") {
//                     console.log('connection answers');

//           if (data.joinedUser) {
//             const content = `<p>${data.joinedUser.pseudo} a rejoint ta partie !<p>`;
//             // .log(`content: ${content}`);
//             answersContainer.insertAdjacentHTML('beforeend',content);
//           }
//         };

//         if (data.status === "running") {
//         //   window.location.reload();
//         //   const runningContainer = document.getElementById('game-running-track')
//         // runningContainer.innerHTML = '';

//         };
//         if (data.status === "paused") {
//           // console.log(data)
//           // console.log('paused answers');
//           // window.location.reload();
//           // playerElt.pause();
//         };
//       }
//     }
//   );
// }

