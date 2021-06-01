class Walk < ApplicationRecord
  belongs_to :user_destination, :class_name => 'Destination'
  belongs_to :buddy_destination, :class_name => 'Destination'
end
