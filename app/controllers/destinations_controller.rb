class DestinationsController < ApplicationController
  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.user = current_user
    if @destination.save
      redirect_to destinations_path
    else
      render :new
    end
  end

  def index
    @destinations = Destination.all
      @destinations.each do |destination|
      @start_location_id = destination.start_location_id
      @end_location_id = destination.end_location_id
      # @start_nearby = User.near(current_user, 10, units: :mi)
      # @end_nearby = User.near(current_user, 10, units: :mi)
    end
  end

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
  private

  def destination_params
    params.require(:destination).permit(:start_point, :end_point)
  end
end
