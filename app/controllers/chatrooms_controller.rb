class ChatroomsController < ApplicationController

  def create
    @chatroom = Chatroom.new
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = Message.create!
  end
end
