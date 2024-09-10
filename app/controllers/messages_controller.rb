class MessagesController <ApplicationController
    before_action :set_room, only: %i[ new create ]

    def new
        @message = @room.messages.new
    end   
    def create
        @message = @room.messages.create!(message_params)
        if @message.save
            redirect_to @room, notice: 'Message was successfully created.'
          else
            render :new
          end
    end

    private

    def set_room
        # @room = Room.find(params[:room_id])
        @room = Room.find(params[:room_id])
        rescue ActiveRecord::RecordNotFound
        redirect_to rooms_path, alert: 'Room not found'
    end

    def message_params
        params.require(:message).permit(:content)
    end


end 