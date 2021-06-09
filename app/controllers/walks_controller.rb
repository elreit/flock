class WalksController < ApplicationController
  def create
    @walk = Walk.new(walk_params)
    @walk.pin = Faker::Code.nric
    @walk.user_destination_id = Destination.where(user_id: current_user.id).last.id
    if @walk.save
      redirect_to dashboard_path(current_user)
    end
  end

  def show
    @walk = Walk.find(params[:id])
  end

  def update
    @walk = Walk.find(params[:id])
    @walk.walk_request_status = params[:format]
    #changing the schema walk_accepted
    @walk.save
    redirect_to dashboard_path(current_user)
  end

  private

  def walk_params
    params.require(:walk).permit(:meeting_point, :buddy_destination_id)
  end
end
