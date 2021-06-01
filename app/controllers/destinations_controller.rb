class DestinationsController < ApplicationController
  def show
    @destination = Destination.find(params[:id])
  end
  
  def update
    @destination = Destination.find(params[:id])
    @destination.started = true
    @walk = Walk.where(user_destination_id: params[:id])
    @destination.save
    redirect_to walk_path(@walk)
  end

  def arrived
    @destination = @destination = Destination.find(params[:id])
    @destination.arrived = true
    @walk = Walk.where(user_destination_id: params[:id])
    @destination.save
    #redirect to review page
  end
end
