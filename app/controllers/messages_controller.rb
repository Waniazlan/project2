class MessagesController < ApplicationController
    before_action :set_room, only: %i[new create]
  
    def new
      @message = @room.messages.new
    end
  
    def create
      @message = @room.messages.create!(message_params)
      if @message.save
        RoomChannel.broadcast_to(@room, {
          content: @message.content,
          created_at: @message.created_at.strftime('%H:%M')
        })
        
        redirect_to room_path(@room), notice: 'Message sent successfully'
      else
       
        render :new, alert: 'Message could not be sent'
      end
    end
  
    private
  
    def set_room
      @room = Room.find(params[:room_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to rooms_path, alert: 'Room not found'
    end
  
    def message_params
      params.require(:message).permit(:content)
    end
  end
  