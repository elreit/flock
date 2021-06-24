class DestinationsController < ApplicationController

  def new
    @destination = Destination.new
    @location = Location.new
    @home = User.find(current_user.id).address
  end

  def get_user_coords
    @destination = Destination.new
    @location = Location.new
    @home = User.find(current_user.id).address
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    @current_location = Geocoder.search([lat, lng]).first
    respond_to do |format|
      format.json {render json: @current_location.to_json, status: 200}
      format.html
    end
  end

  def create
    @start_location = Location.create(address: params[:destination][:start_location])
    @end_location = Location.create(address: params[:destination][:end_location])
    @destination = Destination.new(start_location_id: @start_location.id, end_location_id: @end_location.id)
    @destination.user = current_user
    if @destination.save
      redirect_to destinations_path
    else
      render :new
    end
  end

  def index
    @destination = current_user.destinations.last
    @start_locations = Location.near([@destination.start_location.latitude, @destination.start_location.longitude], 2.5)
    @end_locations = Location.near([@destination.end_location.latitude, @destination.end_location.longitude], 2.5)
    @destinations = Destination.where(start_location_id: @start_locations.map(&:id), end_location_id: @end_locations.map(&:id))
    # @users = User.where(id: @destinations.distinct.pluck(:user_id))
    # @users.each do |user|
    #   @user_destination = user.destinations.last
    # end
    # @reviews = Review.where(reviewee_id: @user.id)
    # sum_rating = 0
    # if @reviews
    #   @reviews.each do |review|
    #    sum_rating += review.rating
    # end
    #   if @reviews.count > 0
    #     @avg_rating = sum_rating / @reviews.count
    #   else
    #     @avg_rating = 'No reviews'
    #   end
    # end
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.started = true
    @destination.save
    # To be change after adding walk
    redirect_to destination_path(@destination.id), notice: "Walk started!"
  end

  def arrived
    @destination = Destination.find(params[:id])
    @destination.arrived = true
    @destination.save
    redirect_to destination_path(@destination.id), notice: "You have arrived!"
    #redirect to review page
  end

  private

end
