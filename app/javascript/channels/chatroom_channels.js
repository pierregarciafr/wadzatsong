import consumer from "./consumer";

const answersContainer = document.getElementById('answers');

if (answersContainer) {
  const id = answersContainer.dataset.gameId; // .gameId ?

  consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
    received(data) {
      console.log(data); // called when data is broadcast in the cable

      // answersContainer.insertAdjacentHTML('beforeend', data);
    }
  });
}

