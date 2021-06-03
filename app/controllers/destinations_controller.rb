class DestinationsController < ApplicationController

  def update
    @destination = Destination.find(params[:id])
    @destination.started = true
    @destination.save
    # To be change after adding walk
    redirect_to destination_path(@destination.id), notice: "Walk started!"
  end

  def arrived
    @destination = Destination.find(params[:id])
    @destination.arrived = true
    @destination.save
    redirect_to destination_path(@destination.id), notice: "You have arrived!"
    #redirect to review page
  end
end
