class WalksController < ApplicationController
  def create
    @walk = Walk.new(walk_params)
    @walk.pin = "1234"
    @walk.user_destination_id = Destination.where(user_id: current_user.id).last.id
    if @walk.save
      redirect_to dashboard_path(current_user.id)
    end
  end

  def update
  end

  private

  def walk_params
    params.require(:walk).permit(:meeting_point, :buddy_destination_id)
  end
end
