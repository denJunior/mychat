class MessagesController < ApplicationController
  before_action :set_room, only: %i[message_sent set_messages]
  before_action :set_messages, only: %i[message_sent]

  def message_sent
    @new_message = current_user.sent_messages.create(body: params[:body],
                                                     room_id: params[:room_id])
    if @new_message.save
      @new_message.broadcast_append_to @new_message.room
    else
      pp 111111111111111
    end
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_messages
    @recipient = User.find params[:recipient_id]
    @messages = @room.messages
  end

  private

  def message_params
    params.permit(:body, :room_id)
  end
end
