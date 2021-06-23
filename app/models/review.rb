class Review < ApplicationRecord
  attr_accessor :favorite # attribute in model that doesn't save to the databse

  belongs_to :user
  belongs_to :reviewee, class_name: 'User'

  has_many :compliments, dependent: :destroy

  validates_presence_of :rating
end
