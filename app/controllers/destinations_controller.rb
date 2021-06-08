class DestinationsController < ApplicationController
  def new
    @destination = Destination.new
    @location = Location.new
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
<<<<<<< HEAD
    @destinations = Destination.all
      @destinations.each do |destination|
      @start_location_id = destination.start_location_id
      @end_location_id = destination.end_location_id
      # @start_nearby = User.near(current_user, 10, units: :mi)
      # @end_nearby = User.near(current_user, 10, units: :mi)
    end
=======
    @destination = current_user.destinations.last
    @start_locations = Location.near([@destination.start_location.latitude, @destination.start_location.longitude], 2.5)
    @end_locations = Location.near([@destination.end_location.latitude, @destination.end_location.longitude], 2.5)
    @destinations = Destination.where(start_location_id: @start_locations.map(&:id), end_location_id: @end_locations.map(&:id))
>>>>>>> dd8db54c69f6f832ab82ac10b15d280f105ca87c
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
<<<<<<< HEAD
    #redirect to review page
  end
    
=======
    # redirect to review page
  end

>>>>>>> dd8db54c69f6f832ab82ac10b15d280f105ca87c
  private

end
