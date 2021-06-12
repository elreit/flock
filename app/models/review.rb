class Review < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :reviewee, class_name: 'User'

  validates_presence_of :rating, :content
end
