class WalksController < ApplicationController
  def create
    @walk = Walk.new(walk_params)
    @walk.pin = Faker::Code.nric
    @walk.user_destination_id = Destination.where(user_id: current_user.id).last.id
    if @walk.save
      redirect_to dashboard_path
    end
  end

  def show
    @walk = Walk.find(params[:id])
    # if I send the request
    my_buddy_destination = Destination.where(id: @walk.buddy_destination_id).last
    @my_buddy = User.find(my_buddy_destination.user_id)
    # if I receive the request
    requester_destination = Destination.where(id: @walk.user_destination_id).last
    @requester = User.find(requester_destination.user_id)
    @meet_point_lng = @walk.longitude
    @meet_point_lat = @walk.latitude
    @my_destination = Destination.where(id: @walk.user_destination_id).last
    chatroom = Chatroom.where(walk_id: params[:id]).last.id
    if chatroom
      message = Message.where(chatroom_id: chatroom).where.not(user_id: current_user.id)
      @new_messages = message.count
    end
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
    meet_arr = [@walk.latitude, @walk.longitude]
    # whatsapp
    @meet = @walk.meeting_point
    # User destination lat lng
    user_dest_id = Destination.find(@walk.user_destination_id).end_location_id
    user_end_location = Location.find(user_dest_id)
    @user_name = Destination.find(@walk.user_destination_id).user.name
    @end = user_end_location.address
    @user_coords = "#{user_end_location.longitude}, #{user_end_location.latitude}"
    user_arr = [user_end_location.latitude, user_end_location.longitude]
    # Buddy destination lat lng
    buddy_dest_id = Destination.find(@walk.buddy_destination_id).end_location_id
    buddy_end_location = Location.find(buddy_dest_id)
    @buddy_coords = "#{buddy_end_location.longitude}, #{buddy_end_location.latitude}"
    buddy_arr = [buddy_end_location.latitude, buddy_end_location.longitude]
    # whatsapp
    buddy = Destination.find(@walk.buddy_destination_id)
    @buddy_name = buddy.user.name
    # Calculate optimal routes
    meet_to_user_end = Geocoder::Calculations.distance_between(meet_arr, user_arr)
    meet_to_buddy_end = Geocoder::Calculations.distance_between(meet_arr, buddy_arr)
    if meet_to_user_end <= meet_to_buddy_end
      @end_first = @user_coords
      @end_sec = @buddy_coords
      @user_steps = @user_name
    else
      @end_first = @buddy_coords
      @end_sec = @user_coords
      @user_steps = @buddy_name
    end
  end

  def destroy
    @walk = Walk.find(params[:id])
    @walk.destroy
    redirect_to dashboard_path(current_user)
  end

  def chatroom
    @chatroom = Chatroom.where(name: "chatroom1")
  end

  private

  def walk_params
    params.require(:walk).permit(:meeting_point, :buddy_destination_id)
  end
end
