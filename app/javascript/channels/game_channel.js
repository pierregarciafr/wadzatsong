import consumer from "./consumer";

const answersContainer = document.getElementById('answers');


if (answersContainer) {
  const id = answersContainer.dataset.gameId; // .gameId ?
  consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
    received(data) {
      window.location.reload();

      // answersContainer.insertAdjacentHTML('beforeend', data);
    }
  });
}

