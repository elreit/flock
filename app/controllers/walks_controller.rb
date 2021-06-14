class WalksController < ApplicationController
    before_action :authenticate_user!, only: :toggle_favorite

  def index
    @walks = Walk.all
    @favorite_walks = current_user.favorited_by_type('Walk')
  end

  def create
    @walk = Walk.new(walk_params)
    @walk.pin = Faker::Code.nric
    @walk.user_destination_id = Destination.where(user_id: current_user.id).last.id
    if @walk.save
      redirect_to dashboard_path(current_user)
    end
  end

  def update
    @walk = Walk.find(params[:id])
    @walk.walk_request_status = params[:format]
    #changing the schema walk_accepted
    @walk.save
    redirect_to dashboard_path(current_user)
  end

  def toggle_favorite
    @walk = Walk.find_by(id: params[:id])
    current_user.favorited?(@walk) ?current_user.unfavorite(@walk) : current_user.favorite(@walk)
  end

  private

  def walk_params
    params.require(:walk).permit(:meeting_point, :buddy_destination_id)
  end
end
