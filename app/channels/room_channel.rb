class RoomChannel < ApplicationCable::Channel
  def subscribed
    @room = Room.find(params[:id])
    stream_for @room
    Rails.logger.info "User subscribed to RoomChannel for room ID #{@room.id}"
  end

  def unsubscribed
    Rails.logger.info "User unsubscribed from RoomChannel for room ID #{@room.id}"
  end

  def speak(data)
    room = Room.find(params[:id])
    room.messages.create!(content: data['content'])
  end
end
