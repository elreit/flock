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
  #validates :emergency_contact_number, format: { with: /\A[1-9]{2}\d{10}\z/, message: "Please enter a valid phone number"}
end
