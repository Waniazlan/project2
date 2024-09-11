import consumer from "channels/consumer"

const roomId = document.querySelector('meta[name="room-id"]').getAttribute('content');

const roomChannel = consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId },{
  connected() {
    console.log(`Connected to room ${roomId}.`);
  },

  disconnected() {
    console.log(`Disconnected from room ${roomId}.`);

  },

  received(data) {
    const messages = document.getElementById('messages');
    messages.innerHTML += `<p>${data.content}</p>`;
  },
  speak: function(content) {
    this.perform('speak', { content: content });
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const messageForm = document.getElementById('message_form');
  if (messageForm) {
    messageForm.addEventListener('submit', function(event) {
      event.preventDefault();
      const content = document.getElementById('message').value;
      roomChannel.speak(content);
      messageForm.reset();
    });
  }
});