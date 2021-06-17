# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# if present in Le Wagon bootcamp
# if present at Home: Emma, Rosi and Mai - current location

require 'faker'
require 'open-uri'

puts "Cleaning the database"
Walk.destroy_all
Location.destroy_all
Destination.destroy_all
User.destroy_all

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
  user.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1621452023/aflbe156grlwfz860qfp7a00edau.jpg'), filename: 'avatar.png', content_type: 'image/jpg')
  user.save!
end

mai = User.new(name: "Mai Hoang", email: "mai@email.com", password: "123456", description: "Hey gals I am currently a tax consultant and live in East London. During the busy season I usually go home late and don't feel safe. It would be fantastic to have a buddy to tag along.", emergency_contact_name: "Boris", emergency_contact_number: "447707872023", address: "E16 1EA")
mai.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623343312/15093533_1_kd79gh.png'), filename: 'avatar.png', content_type: 'image/png')
mai.save!

luisa = User.new(name: "Luisa Von Funcke", email: "luisa@email.com", password: "123456", description: "Hi ladies I am working in Quality Assurance in a big tech company. I live in West London at the moment and usually walk home around 9. There are some pubs around my flat so it's quite dangerous at night. I would love to share my walk with someone to feel safer", emergency_contact_name: "Marco", emergency_contact_number: "447707872023")
luisa.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623198674/gcowectu20048ugsvp3qj3hmcli7.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
luisa.save!

rosi = User.new(name: "Rosita Alvarado", email: "rosi@email.com", password: "123456", description: "I'm from Los Angeles and moved to London this past March. I currently work as an administrative manager of an academic research journal. I am living alone and new to the area. It would be great to have someone to walk home together.", emergency_contact_name: "Lucien", emergency_contact_number: "447707872023")
rosi.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623343311/67096324_i2t9rc.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
rosi.save!

emma = User.new(name: "Emma Reitman", email: "emma@email.com", password: "123456", description: "Hiya! I am from London and work at an advertising agency. I live in West London and due to the nature of my work I sometimes walk home really late. I don't feel safe around my area and would love to have someone to walk together.", emergency_contact_name: "Sam", emergency_contact_number: "447707872023")
emma.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623345944/iht9frnudlxr5wh4fygfua1w8ghq.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
emma.save!

anne = User.new(name: "Anne de Joly", email: "anne@email.com", password: "123456", description: "Hi girls, I am a teacher at Le Wagon. I sometimes have evening classes so walk home late. I would love to have a buddy to share the walk with me as it could be scary at times", emergency_contact_name: "Boris", emergency_contact_number: "447707872023")
anne.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623348896/oq7qnbqnylry314xj2zfi5fe8ly9.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
anne.save!

puts "#{User.count} users have been created"

puts "Creating locations"

start_point1 = Location.new(address: "138 Kingsland Road, London")
start_point1.save!
start_point2 = Location.new(address: "Hoxton Station, London")
start_point2.save!
start_point3 = Location.new(address: "Le Wagon, London")
start_point3.save!
start_point4 = Location.new(address: "Hoxton Station, London")
start_point4.save!
start_point5 = Location.new(address: "Star Lane Station, London")
start_point5.save!

puts "5 start points have been created"

end_point1= Location.new(address: "Shoreditch, London")
end_point1.save!
end_point2 = Location.new(address: "Shoreditch, London")
end_point2.save!
end_point3 = Location.new(address: "Excel London")
end_point3.save!
end_point4 = Location.new(address: "University of East London, London")
end_point4.save!
end_point5 = Location.new(address: "Hoxton Station, London")
end_point5.save!

puts "5 end points have been created"

puts "Creating destinations"

dest1 = Destination.new(
    user: User.first,
    start_location_id: start_point1.id,
    end_location_id: end_point1.id
    )
dest1.save!

dest2 = Destination.new(
    user: User.last,
    start_location_id: start_point2.id,
    end_location_id: end_point2.id
    )
dest2.save!

dest3 = Destination.new(
    user: luisa,
    start_location_id: start_point3.id,
    end_location_id: end_point3.id
)
dest3.save!

dest4 = Destination.new(
    user: emma,
    start_location_id: start_point5.id,
    end_location_id: end_point4.id
)
dest4.save!

dest5 = Destination.new(
    user: rosi,
    start_location_id: start_point3.id,
    end_location_id: end_point4.id
)
dest5.save!

puts "#{Destination.count} destinations have been created"

puts "Creating a walk"

walk = Walk.new(
  user_destination_id: dest1.id,
  buddy_destination_id: dest2.id,
  meeting_point: "Front door LW",
  pin: "1234")
walk.save!

puts "#{Walk.count} walk has been created"
