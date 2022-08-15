module Api
  module V1
    class MessageCreateController < Api::V1::ApplicationController
      before_action :users, only: [:create]

      def create
        # messages = Message.where(recipient_id: @recipient.id, user_id: @current_user.id, room_id: params[:room_id])
        #                   .or(Message.where(user_id: @recipient.id, recipient_id: @current_user.id,
        #                                     room_id: params[:room_id]))
        # messages.each do |m|
        #   m.body = Obscenity.replacement(:stars).sanitize(m.body) if Obscenity.profane?(m.body)
        # end
        # old_time = I18n.l(Message.last.created_at, format: :message_time)
        # ActionCable.server.broadcast('MyChannel',
        #                              { current_user_id: @current_user.id, created_at: old_time,
        #                                messages: messages })

        # head :ok
        @new_message = if params[:file]
                         @current_user.sent_messages.create(body: params[:body],
                                                            file: params[:file].original_filename, room_id: params[:room_id])
                       else
                         @current_user.sent_messages.create(body: params[:body],
                                                            room_id: params[:room_id])
                       end
        if @new_message.save
          @new_message.broadcast_append_to @new_message.room
        end

        head :ok
      end

      private

      def users
        @recipient = User.find params[:recipient_id]
      end
    end
  end
end
