class Destination < ApplicationRecord
  belongs_to :user
  # has_many :walks -a walk must exist for destination to be created

  belongs_to :start_location, class_name: 'Location', foreign_key: "start_location_id"
  belongs_to :end_location, class_name: 'Location', foreign_key: "end_location_id"
end

# class Destination < ApplicationRecord
#   before_save :geocode_endpoints
#   geocoded_by :start_point, latitude: :start_lat, longitude: :start_long
#   geocoded_by :end_point, latitude: :end_lat, longitude: :end_long
#   belongs_to :user
#   # belongs_to :walk

#   private

#   def geocode_endpoints
#     if start_point_changed?
#       geocoded = Geocoder.search(start_point).first
#       if geocoded
#         self.start_lat = geocoded.latitude
#         self.start_long = geocoded.longitude
#       end
#     end
#     if end_point_changed?
#       geocoded = Geocoder.search(end_point).first
#       if geocoded
#         self.end_lat = geocoded.latitude
#         self.end_long = geocoded.longitude
#       end
#     end
#   end
# end
