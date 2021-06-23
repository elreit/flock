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
Compliment.destroy_all
Review.destroy_all
Walk.destroy_all
Location.destroy_all
Destination.destroy_all
User.destroy_all

puts "Creating Flock team in Shoreditch area"

mai = User.new(name: "Mai Hoang", email: "mai@email.com", password: "123456", description: "Hey gals I am currently a tax consultant and live in Shoreditch. During the busy season I usually go home late and don't feel safe. It would be fantastic to have a buddy to tag along.", emergency_contact_name: "Boris", emergency_contact_number: "447707872023", address: "88 Colombia Road, London")
mai.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1624110631/wiuarvo4bresoyg4y1683gzvkrd0.png'), filename: 'avatar.png', content_type: 'image/png')
mai.save!

luisa = User.new(name: "Luisa Von Funcke", email: "luisa@email.com", password: "123456", description: "Hi ladies I am working in Quality Assurance in a big tech company. I live in West London at the moment and usually walk home around 9. There are some pubs around my flat so it's quite dangerous at night. I would love to share my walk with someone to feel safer", emergency_contact_name: "Marco", emergency_contact_number: "447707872023", address: "90 Colombia Road, London")
luisa.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623343312/75794762_qo3zco.png'), filename: 'avatar.png', content_type: 'image/png')
luisa.save!

rosi = User.new(name: "Rosita Alvarado", email: "rosi@email.com", password: "123456", description: "I'm from Los Angeles and moved to London this past March. I currently work as an administrative manager of an academic research journal. I am living alone around Shoreditch area. It would be great to have someone to walk home together.", emergency_contact_name: "Lucien", emergency_contact_number: "447707872023", address: "7 Boundary Street, London")
rosi.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623343311/67096324_i2t9rc.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
rosi.save!

emma = User.new(name: "Emma Reitman", email: "emma@email.com", password: "123456", description: "Hiya! I am from London and work at an advertising agency. I live in West London and due to the nature of my work I sometimes walk home really late. I don't feel safe around my area and would love to have someone to walk together.", emergency_contact_name: "Sam", emergency_contact_number: "447707872023", address: "139 Kingsland Road, London")
emma.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623345944/iht9frnudlxr5wh4fygfua1w8ghq.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
emma.save!

anne = User.new(name: "Anne de Joly", email: "anne@email.com", password: "123456", description: "Hi girls, I am a teacher at Le Wagon. I sometimes have classes in the evening so have to walk home quite late. I would love to have a buddy to share the walk with me as it could be scary at times walking in Shoreditch High Street", emergency_contact_name: "Ife", emergency_contact_number: "447707872023", address: "56 Shoreditch High Street, London")
anne.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623348896/oq7qnbqnylry314xj2zfi5fe8ly9.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
anne.save!

puts "Creating 3 other users in Canning Town"

abbie = User.new(name: "Abbie Jones", email: "abbie@email.com", password: "123456", description: "Hey gals I am currently a consultant and live in East London. During the busy season I usually go home late and don't feel safe. It would be lovely to have a buddy to tag along.", emergency_contact_name: "Boris", emergency_contact_number: "447707872023", address: "1016 Dockside Road, London")
abbie.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1624372622/image_sglbub.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
abbie.save!

jess = User.new(name: "Jessica Cole", email: "jess@email.com", password: "123456", description: "Hi ladies I am currently a fitness instructor and live in Canning Town. I usually go home late and don't feel safe. It would be fantastic to have a buddy to walk together.", emergency_contact_name: "Sam", emergency_contact_number: "447707872023", address: "1016 Dockside Road, London")
jess.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1624372633/image_3_xpwqyx.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
jess.save!

christine = User.new(name: "Christine Quinn", email: "christine@email.com", password: "123456", description: "Hiya I am currently a model and live in East London. I sometimes go home late and don't feel safe. It would be great to have someone to walk home with.", emergency_contact_name: "Marco", emergency_contact_number: "447707872023", address: "1 Shackleton Way, London")
christine.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1624058981/bmu9ft7ov4xegfuocraf1tq6b4wu.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
christine.save!

puts "#{User.count} users have been created"

puts "Creating locations"

start_point1 = Location.new(address: "138 Kingsland Rd, London, E2 8DY")
start_point1.save!
start_point2 = Location.new(address: "130 Hoxton St, London, N1 6SH")
start_point2.save!
start_point3 = Location.new(address: "Shoreditch Highstreet, London")
start_point3.save!
start_point4 = Location.new(address: "Hoxton station, London")
start_point4.save!
start_point5 = Location.new(address: "Star Lane Station, London")
start_point5.save!
start_point6 = Location.new(address: "Canning Town Station, London")
start_point6.save!

puts "4 start points in Shoreditch and 2 start points in Canning Town have been created "

end_point1= Location.new(address: "3 Hackney Rd, London, E2 7NX")
end_point1.save!
end_point2 = Location.new(address: "141-143 Shoreditch High St, London, E1 6JE")
end_point2.save!
end_point3 = Location.new(address: "7 Boundary Street, London, E2 7JE")
end_point3.save!
end_point4 = Location.new(address: "58-60 Redchurch St, London, E2 7DP")
end_point4.save!
end_point5 = Location.new(address: "56 Shoreditch High Street, London")
end_point5.save!
end_point6 = Location.new(address: "1016 Dockside Road, London")
end_point6.save!
end_point7 = Location.new(address: "1 Shackleton Way, London")
end_point7.save!

puts "5 end points in Shoreditch and 2 endpoints in Canning Town have been created"

puts "Creating destinations for Flock team"

dest1 = Destination.new(
    user: mai,
    start_location_id: start_point2.id,
    end_location_id: end_point2.id
    )
dest1.save!

dest2 = Destination.new(
    user: luisa,
    start_location_id: start_point2.id,
    end_location_id: end_point4.id
    )
dest2.save!

dest3 = Destination.new(
    user: rosi,
    start_location_id: start_point1.id,
    end_location_id: end_point3.id
)
dest3.save!

dest4 = Destination.new(
    user: anne,
    start_location_id: start_point1.id,
    end_location_id: end_point2.id
)
dest4.save!

puts "Creating destinations for users in Canning Town"

dest5 = Destination.new(
    user: abbie,
    start_location_id: start_point6.id,
    end_location_id: end_point6.id
)
dest5.save!

dest6 = Destination.new(
    user: jess,
    start_location_id: start_point5.id,
    end_location_id: end_point6.id
)
dest6.save!

dest7 = Destination.new(
    user: christine,
    start_location_id: start_point6.id,
    end_location_id: end_point7.id
)
dest7.save!

puts "#{Destination.count} destinations have been created"

puts "Creating walks for Mai"

24.times do
  walk = Walk.new(
    user_destination_id: dest1.id,
    buddy_destination_id: dest2.id,
    meeting_point: "138 Kingsland Road, London",
    walk_request_status: "Accepted",
    pin: "BR595"
  )
  walk.save!
end

puts "Creating walks for Rosi"

16.times do
  walk = Walk.new(
    user_destination_id: dest3.id,
    buddy_destination_id: dest4.id,
    meeting_point: "Hoxton Station, London",
    walk_request_status: "Accepted",
    pin: "BRG595"
  )
  walk.save!
end

puts "Creating walks for Luisa"

luisa_walk = Walk.new(
  user_destination_id: dest2.id,
  buddy_destination_id: dest4.id,
  meeting_point: "Shoreditch, London",
  walk_request_status: "Accepted",
  pin: "BRG595"
)
luisa_walk.save!

puts "#{Walk.count} walks have been created"

puts "Creating reviews for Mai"

review1 = Review.new(
    rating: rand(4..5),
    user_id: luisa.id,
    reviewee_id: mai.id
  )
review1.save!

puts "#{Review.count} reviews have been created"

puts "Creating compliments for Mai"
compliment = Compliment.new(
    review_id: review1.id,
    content: "Nice conversation"
  )
compliment.save!

puts "#{Compliment.count} compliments have been created"
