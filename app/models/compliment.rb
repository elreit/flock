class Compliment < ApplicationRecord
  belongs_to :review
  validates_presence_of :content

  COMPLIMENTS = ["Nice conversation", "Punctual", "Good walking pace", "Great proximity"]
end
