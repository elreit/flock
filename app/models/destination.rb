class Destination < ApplicationRecord
  belongs_to :user
  # has_many :walks -a walk must exist for destination to be created

  belongs_to :start_location, class_name: 'Location', foreign_key: "start_location_id"
  belongs_to :end_location, class_name: 'Location', foreign_key: "end_location_id"
end
