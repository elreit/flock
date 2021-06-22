class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :destinations, -> { order 'created_at asc' }
  has_many :reviews
  has_one_attached :photo

  validates_presence_of :photo
  validates :name, :description, :emergency_contact_name, :emergency_contact_number, presence: true
  validates :emergency_contact_number, format: { with: /\A[1-9]{2}\d{10}\z/, message: "Please enter a valid phone number" }

  def reviews
    reviews = Review.where(reviewee_id: id)
    avg_rating = 'No reviews'
    sum_rating = 0
    if reviews
      reviews.each do |review|
        sum_rating += review.rating
      end
      if reviews.count > 0
        avg_rating = sum_rating / reviews.count
      end
    end
    avg_rating
  end

  def walks
    total_walks = 0
    # get all past destinations
    past_destinations = Destination.where(user_id: id)
    # find walks that have user_destination && walk_request_status accepted
    past_destinations.each do |dest|
      walks_as_requestor = Walk.where(user_destination_id: dest.id, walk_request_status: "Accepted").count
      total_walks += walks_as_requestor
    # find walks that have buddy_destination && walk_request_status accepted
      walks_as_buddy = Walk.where(buddy_destination_id: dest.id, walk_request_status: "Accepted").count
      total_walks += walks_as_buddy
    end
    total_walks
  end
end
