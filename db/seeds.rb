# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts "Cleaning the database"
Walk.destroy_all
Destination.destroy_all
User.destroy_all

photo = URI.open('https://ath2.unileverservices.com/wp-content/uploads/sites/4/2020/02/IG-annvmariv-1024x1016.jpg')

puts "Creating users"
2.times do
  user = User.new(
    name: Faker::FunnyName.two_word_name,
    email: Faker::Internet.email,
    password: "123456",
    description: Faker::GreekPhilosophers.quote,
    emergency_contact_number: "07707872023",
    emergency_contact_name: Faker::FunnyName.two_word_name,
  )
  user.photo.attach(io: photo, filename: 'user.jpg', content_type: 'image/jpg')
  user.save!
end

puts "#{User.count} users have been created"

puts "Creating destinations"

dest1 = Destination.new(
    user: User.first,
    start_point: "Le Wagon",
    end_point: "Disneyland"
    )
dest1.save!

dest2 = Destination.new(
    user: User.last,
    start_point: "Le Wagon",
    end_point: "Disneyland"
    )
dest2.save!

puts "#{Destination.count} destinations have been created"

puts "Creating a walk"

walk = Walk.new(
  user_destination_id: dest1.id,
  buddy_destination_id: dest2.id,
  meeting_point: "Front door LW",
  pin: "1234")
walk.save!



puts "#{Walk.count} walk has been created"



