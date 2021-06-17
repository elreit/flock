class Walk < ApplicationRecord
  belongs_to :user_destination, :class_name => 'Destination'
  belongs_to :buddy_destination, :class_name => 'Destination'
  geocoded_by :meeting_point
  after_validation :geocode, if: :will_save_change_to_meeting_point?
  after_create :create_chatroom
  has_one :chatroom

  def create_chatroom
    Chatroom.create(walk: self)
  end
end
