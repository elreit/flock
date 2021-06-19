class ChatroomsController < ApplicationController

  def create
    @chatroom = Chatroom.new
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @walk = Walk.find(@chatroom.walk_id)
  end
end
