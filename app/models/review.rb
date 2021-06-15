class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewee, class_name: 'User'

  has_many :compliments

  validates_presence_of :rating
end
