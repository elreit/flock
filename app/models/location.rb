class Location < ApplicationRecord
  has_many :start_destinations, class_name: 'Destination', foreign_key: 'start_location_id'
  has_many :end_destinations, class_name: 'Destination', foreign_key: 'end_location_id'

  geocoded_by :address
  after_validation :geocode
end
