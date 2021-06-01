class DestinationsController < ApplicationController

  def new
    @destination = Destination.new(destination_params)
    @destination.user = current_user
    @destination.save
      redirect_to destinations_path(@destinations)
  end

  private

  def destination_params
    params.require(:destination).permit(:start_point, :end_point)
  end
end
