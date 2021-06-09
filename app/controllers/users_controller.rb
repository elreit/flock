class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @destination = Destination.where(user_id: params[:id]).last
    @walk = Walk.new
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
  end
end
