class RoomsController < ApplicationController
  before_action :user_and_room, only: %i[show set_rec_id]
  before_action :rec_for_create, only: %i[create]

  def show
    @messages = @room.messages
    if @messages.count < 2
      @recipient.sent_messages.create(body: params[:body],
                                      room_id: params[:room_id])
    end
    @old_time = begin
      Message.last.created_at
    rescue StandardError
      'newer'
    end
  end

  def new; end

  def user_and_room
    @room = Room.find params[:room_id]
    if params[:recipient_id]
      @recipient = User.find params[:recipient_id]
      @recipient_user_name = if @recipient.user_name == ''
                               @recipient.email
                             else
                               @recipient.user_name
                             end
    end
  end

  def rec_for_create
    @recipient = User.find params[:recipient_id]
  end

  def create
    room = current_user.rooms.create(user_id: params[:recipient_id], title: params[:title])
    if room.save
      redirect_to room_path(id: current_user, room_id: room, recipient_id: params[:recipient_id])
    else
      pp 11111
    end
  end
end
