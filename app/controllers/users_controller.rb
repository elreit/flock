class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @destination = Destination.where(user_id: params[:id]).last
    @walk = Walk.new
    @total_walks = 0
    # get all past destinations
    past_destinations = Destination.where(user_id: params[:id])
    # find walks that have user_destination && walk_request_status accepted
    past_destinations.each do |dest|
      walks_as_requestor = Walk.where(user_destination_id: dest.id, walk_request_status: "Accepted").count
      @total_walks += walks_as_requestor
    # find walks that have buddy_destination && walk_request_status accepted
      walks_as_buddy = Walk.where(buddy_destination_id: dest.id, walk_request_status: "Accepted").count
      @total_walks += walk_as_buddy
    end
    # count the above 2 to get total number of past walks
  end

  def dashboard
    # Walk request I sent, I hold user_destination_id
    my_destination = Destination.where(user_id: current_user.id).last
    if my_destination
      @my_walk_request = Walk.where(user_destination_id: my_destination.id).last
      if @my_walk_request
        my_buddy_destination = Destination.where(id: @my_walk_request.buddy_destination_id).last
        @my_buddy = my_buddy_destination.user
      end
    # Walk request I received, I hold buddy_destination_id
      @walk_request_received = Walk.where(buddy_destination_id: my_destination.id).last
      if @walk_request_received
        requester_destination = Destination.where(id: @walk_request_received.user_destination_id).last
        @requester = requester_destination.user
      end
    end
    # Mapbox

    @meeting_point = @my_walk_request
    @markers = [lat: @meeting_point.latitude, lng: @meeting_point.longitude, info_window: render_to_string(partial: "info_window")]
    @start_point = [0.21936, 51.51542660]
    @meet_point = [@my_walk_request.longitude, @my_walk_request.latitude]
  end
end
