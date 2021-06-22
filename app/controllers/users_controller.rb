class UsersController < ApplicationController

  def favorites
    @user = User.find(params[:user_id])
    @favorites = @user.all_favorited
    # @favorites.each do |favorite|
    #   @name = favorite.name
    #   buddy_id = favorite.id
    #   buddy_review = Review.where(reviewee_id: buddy_id, user_id: params[:user_id]).last
    #   if buddy_review
    #     @compliments = Compliment.where(review_id: buddy_review.id).content
    #   end
    # end
  end

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
      @total_walks += walks_as_buddy
    end
    # count the above 2 to get total number of past walks
    # review
    @reviews = Review.where(reviewee_id: @user.id)
    sum_rating = 0
    if @reviews
      @reviews.each do |review|
        sum_rating += review.rating
      end
      if @reviews.count > 0
        @avg_rating = sum_rating / @reviews.count
      else
        @avg_rating = 'No reviews'
      end
    end
  end

  def dashboard
    # Walk request I sent, I hold user_destination_id
    my_destination = Destination.where(user_id: current_user.id).last
    if my_destination
      @my_walk_request = Walk.where(user_destination_id: my_destination.id).last
      if @my_walk_request
        my_buddy_destination = Destination.where(id: @my_walk_request.buddy_destination_id).last
        @my_buddy = my_buddy_destination.user
        @markers = [lat: @my_walk_request.latitude, lng: @my_walk_request.longitude, info_window: render_to_string(partial: "info_window")]
        @meet_point = [@my_walk_request.longitude, @my_walk_request.latitude]
      end
    # Walk request I received, I hold buddy_destination_id
      @walk_request_received = Walk.where(buddy_destination_id: my_destination.id).last
      if @walk_request_received
        requester_destination = Destination.where(id: @walk_request_received.user_destination_id).last
        @requester = requester_destination.user
        @buddymarkers = [lat: @walk_request_received.latitude, lng: @walk_request_received.longitude]
        @buddy_meet_point = [@walk_request_received.longitude, @walk_request_received.latitude]
        @badge = 1
      else
        @badge = 0
      end
    # If user has already confirmed a walk with someone, the incoming request should be declined. Or user choose.
    end

  end
end
