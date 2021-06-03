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

  private

  def destination_params
    params.require(:destination).permit(:start_point, :end_point)
  end
end
