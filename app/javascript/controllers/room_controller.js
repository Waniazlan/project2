import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["messages"]

  connect() {
    this.channel = this.createRoomChannel()
    console.log("hello channells")
  }

  createRoomChannel() {
    return cable.subscriptions.create({ channel: "RoomChannel", id: this.data.get("id") }, {
      received: (data) => {
        const messageElement = document.createElement('div')
        messageElement.innerHTML = `
          <p>
            <strong>${data.created_at}:</strong>
            ${data.content}
          </p>
        `
        this.messagesTarget.appendChild(messageElement)
      }
    })
  }
}
