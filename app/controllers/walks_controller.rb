class WalksController < ApplicationController
  before_action :authenticate_user!, only: :toggle_favorite

  def toggle_favorite
    @walk = Walk.find_by(id: params[:id])
    current_user.favorited?(@walk) ? current_user.unfavorite(@walk) : current_user.favorite(@walk)
  end

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

  def show
    @walk = Walk.find(params[:id])
    my_buddy_destination = Destination.where(id: @walk.buddy_destination_id).last
    @my_buddy = User.find(my_buddy_destination.user_id)
    @meet_point_lng = @walk.longitude
    @meet_point_lat = @walk.latitude
    @my_destination = Destination.where(id: @walk.user_destination_id).last
  end

  def update
    @walk = Walk.find(params[:id])
    @walk.walk_request_status = params[:format]
    #changing the schema walk_accepted
    @walk.save
    redirect_to dashboard_path(current_user)
  end

  def routes
    @walk = Walk.find(params[:id])
    # Meeting point lat lng
    @meet_point = "#{@walk.longitude}, #{@walk.latitude}"
    # User destination lat lng
    user_dest_id = Destination.find(@walk.user_destination_id).end_location_id
    user_end_location = Location.find(user_dest_id)
    @user_coords = "#{user_end_location.longitude}, #{user_end_location.latitude}"
    # Buddy destination lat lng
    buddy_dest_id = Destination.find(@walk.buddy_destination_id).end_location_id
    buddy_end_location = Location.find(buddy_dest_id)
    @buddy_coords = "#{buddy_end_location.longitude}, #{buddy_end_location.latitude}"
  end

  private

  def walk_params
    params.require(:walk).permit(:meeting_point, :buddy_destination_id)
  end
end
