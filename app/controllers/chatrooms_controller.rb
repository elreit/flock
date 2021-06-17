class ChatroomsController < ApplicationController

  def create
    @chatroom = Chatroom.new
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
