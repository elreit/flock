class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all

   #  User.near(@current_user, 10, units: :mi).each do |user|
   #   puts "#{user.name} is #{user.distance} clicks to the #{user.bearing}"
   # end

    @markers = @destinations.geocoded.map do |destination|
      {
        lat: destination.latitude,
        lng: destination.longitude
      }
    end
  end

#   if obj.geocoded?
#   obj.nearbys(30)                       # other objects within 30 miles
#   obj.distance_from([40.714,-100.234])  # distance from arbitrary point to object
#   obj.bearing_to("Paris, France")       # direction from object to arbitrary point
#   end

  # def address
  #   [street, city, state, country].compact.join(', ')
  # end
end
