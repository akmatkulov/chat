class RoomsController < ApplicationController
    def index
        @new_room = Room.new
        @rooms = Room.all
    end

    def show
        @room = Room.find_by!(title: params[:title])
        @messages = @room.messages
        @new_message = current_user&.messages&.build
    end

    def create
        @new_room = current_user&.rooms&.build(params_room)
        if @new_room&.save
            @new_room.broadcast_append_to :rooms
        end

    end
    private 
        def params_room
            params.require(:room).permit(:title)
        end
end