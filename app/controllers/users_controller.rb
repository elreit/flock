class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @destination = Destination.where(user_id: params[:id]).last
    @walk = Walk.new
  end

  def dashboard
    @walk = Walk.all
  end
end
