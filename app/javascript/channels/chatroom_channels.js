import consumer from "./consumer";

const messagesContainer = document.getElementById('messages');
if (messagesContainer) {
  const id = messagesContainer.dataset.chatroomId;

  consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
    received(data) {
      console.log(data); // called when data is broadcast in the cable
    },
  });
}

