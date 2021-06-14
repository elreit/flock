class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.order('created_at DESC')
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.create!(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end

    private

    def message_params
      params.require(:message).permit(:user, :content)
    end
  end
end
