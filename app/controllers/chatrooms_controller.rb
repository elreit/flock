class ChatroomsController < ApplicationController

  def create
    @chatroom = Chatroom.new
    end

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = Message.order('created_at DESC')
  end
end
