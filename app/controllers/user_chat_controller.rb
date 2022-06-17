class UserChatController < ApplicationController
  def create
    recipient = User.find params[:message][:user_id]
    @message = current_user.sent.create(recipient: recipient, body: message_params[:body])
    @message.save

    redirect_to user_chat_path(user_id: recipient.id)
  end

  def user_chat
    @user = User.find params[:user_id]
    @messages = Message.where(recipient_id: @user.id, sender_id: current_user.id)
                       .or(Message.where(sender_id: @user.id, recipient_id: current_user.id))
    @old_time = Message.last.created_at
    # ActionCable.server.broadcast("user_id=1", { body: Message.where(sender_id: @user.id, recipient_id: current_user.id) })
  end

  def messages
    # @user = User.find params[:user_id]
    # @messages_after_update = Message.where(recipient_id: @user.id, sender_id: current_user.id)
    # render json: @messages_after_update
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end