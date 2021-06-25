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
Review.destroy_all

puts "Creating Flock team in Shoreditch area"

mai = User.new(name: "Mai Hoang", email: "mai@email.com", password: "123456", description: "Hey gals I am currently a tax consultant and live in East London. During the busy season I usually go home late and don't feel safe. It would be fantastic to have a buddy to tag along.", emergency_contact_name: "Boris", emergency_contact_number: "447483400327", address: "E16 1EA")
mai.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1624377156/67fxo5e4wlll8mk1r95h0zctu7cy.png'), filename: 'avatar.png', content_type: 'image/png')
mai.save!

luisa = User.new(name: "Luisa Von Funcke", email: "luisa@email.com", password: "123456", description: "Hi ladies I am working in Quality Assurance in a big tech company. I live in West London at the moment and usually walk home around 9. There are some pubs around my flat so it's quite dangerous at night. I would love to share my walk with someone to feel safer", emergency_contact_name: "Marco", emergency_contact_number: "447483400327")
luisa.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623343312/75794762_qo3zco.png'), filename: 'avatar.jpg', content_type: 'image/jpg')
luisa.save!

rosi = User.new(name: "Rosita Alvarado", email: "rosi@email.com", password: "123456", description: "I'm from Los Angeles and moved to London this past March. I currently work as an administrative manager of an academic research journal. I am living alone around Shoreditch area. It would be great to have someone to walk home together.", emergency_contact_name: "Lucien", emergency_contact_number: "447483400327", address: "7 Boundary Street, London")
rosi.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623343311/67096324_i2t9rc.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
rosi.save!

emma = User.new(name: "Emma Reitman", email: "emma@email.com", password: "123456", description: "Hiya! I am from London and work at an advertising agency. I live in West London and due to the nature of my work I sometimes walk home really late. I don't feel safe around my area and would love to have someone to walk together.", emergency_contact_name: "Sam", emergency_contact_number: "447483400327", address: "7 Boundary Street, London, E2 7JE")
emma.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1623345944/iht9frnudlxr5wh4fygfua1w8ghq.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
emma.save!

anne = User.new(name: "Anne de Joly", email: "anne@email.com", password: "123456", description: "Hi girls, I am a teacher at Le Wagon. I sometimes have evening classes so walk home late. I would love to have a buddy to share the walk with me as it could be scary at times", emergency_contact_name: "Boris", emergency_contact_number: "447707872023")
anne.photo.attach(io: URI.open('https://res.cloudinary.com/djiwfu4hh/image/upload/v1624647878/anne_j5gi7p.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
anne.save!

puts "Creating 3 other users in Canning Town"

abbie = User.new(name: "Abbie Jones", email: "abbie@email.com", password: "123456", description: "Hey gals I am currently a consultant and live in East London. During the busy season I usually go home late and don't feel safe. It would be lovely to have a buddy to tag along.", emergency_contact_name: "Boris", emergency_contact_number: "447483400327", address: "1016 Dockside Road, London")
abbie.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1624372622/image_sglbub.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
abbie.save!

jess = User.new(name: "Jessica Cole", email: "jess@email.com", password: "123456", description: "Hi ladies I am currently a fitness instructor and live in Canning Town. I usually go home late and don't feel safe. It would be fantastic to have a buddy to walk together.", emergency_contact_name: "Sam", emergency_contact_number: "447483400327", address: "1016 Dockside Road, London")
jess.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1624372633/image_3_xpwqyx.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
jess.save!

christine = User.new(name: "Christine Quinn", email: "christine@email.com", password: "123456", description: "Hiya I am currently a model and live in East London. I sometimes go home late and don't feel safe. It would be great to have someone to walk home with.", emergency_contact_name: "Marco", emergency_contact_number: "447483400327", address: "1 Shackleton Way, London")
christine.photo.attach(io: URI.open('https://res.cloudinary.com/diq781xvq/image/upload/v1624058981/bmu9ft7ov4xegfuocraf1tq6b4wu.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
christine.save!

puts "Creating 10 other users"

charlotte = User.new(name: "Charlotte Jacobs", email: "charlotte@email.com", password: "123456", description: "Hi girls, I am a TV producer and my shoots often run on late. Sometimes this is after public transport timetable and I'd feel more comfortable having someone to walk back with.", emergency_contact_name: "David", emergency_contact_number: "447483400327")
charlotte.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462456/flock%20seed%20file/charotte_thf9mb.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
charlotte.save!

cora = User.new(name: "Cora Bates", email: "cora@email.com", password: "123456", description: "I am an educational psychologist and work at schools. I need to walk 25 mins to the nearest station for my commute and I would prefer to share the journey with someone.", emergency_contact_name: "Jack", emergency_contact_number: "447483400327")
cora.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462456/flock%20seed%20file/cora_bfkdpx.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
cora.save!

stephanie = User.new(name: "Stephanie Leftwoman", email: "stephanie@email.com", password: "123456", description: "I volunteer on Thursday nights and the roads aren't well lit. I'd feel safer if I could walk with someone for part of my journey!", emergency_contact_name: "Ron", emergency_contact_number: "447483400327")
stephanie.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462456/flock%20seed%20file/stephanie_y9nuex.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
stephanie.save!

sasha = User.new(name: "Sasha Stock", email: "sasha@email.com", password: "123456", description: "Hi everyone, I am head of department at a secondary school. I play netball on Monday nights and in the winter it is dark walking home from the bus stop to my flat.", emergency_contact_name: "Sammy", emergency_contact_number: "447483400327")
sasha.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462456/flock%20seed%20file/sasha_xxrpyg.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
sasha.save!

emily = User.new(name: "Emily Ellis", email: "emily@email.com", password: "123456", description: "I love using Flock! I started out at an advertising agency where the hours were crazy long and I had to walk some of my commute home. Flock found other women near me to help me feel safe when walking.", emergency_contact_name: "Lynton", emergency_contact_number: "447483400327")
emily.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462456/flock%20seed%20file/emily_n95c7w.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
emily.save!

becky = User.new(name: "Becky Alvey", email: "becky@email.com", password: "123456", description: "My flat is accessed via some commons and parks which can be quiet at night. It takes twice as long to walk around, so I'd like to have a buddy who can walk with me and help me feel safe.", emergency_contact_name: "Milton", emergency_contact_number: "447483400327")
becky.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462455/flock%20seed%20file/becky_vrncdq.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
becky.save!

joely = User.new(name: "Joely Buxton", email: "joely@email.com", password: "123456", description: "New to Flock! My flat isn't on a bus or train route so I need to walk across some badly lit roads. Having someone else walk with me will give me an added layer of security and reassurance.", emergency_contact_name: "Steven", emergency_contact_number: "447483400327")
joely.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462456/flock%20seed%20file/joely_csk7ey.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
joely.save!

leyla = User.new(name: "Leyla Tezcan", email: "leyla@email.com", password: "123456", description: "I work as head of marketing at an agency and the hours can be long. Having someone to walk with especially at night when it is dark will give me the security I need.", emergency_contact_name: "Elliott", emergency_contact_number: "447483400327")
leyla.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462456/flock%20seed%20file/leyla_uoz0eb.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
leyla.save!

issy = User.new(name: "Issy Jordan", email: "issy@email.com", password: "123456", description: "I like to go out on Saturday nights and don't always have the money to pay for an Uber so I like to walk. But I have had some bad experiences when walking alone and would prefer a buddy to help me feel safe.", emergency_contact_name: "Charlie", emergency_contact_number: "447483400327")
issy.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462456/flock%20seed%20file/issy_mwylqe.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
issy.save!

beth = User.new(name: "Beth Kodjer", email: "beth@email.com", password: "123456", description: "I have just changed job and work as a civil servant. I am still getting used to my commute and the local area so I'd like to use Flock to meet people and to help me find my way.", emergency_contact_name: "Ben", emergency_contact_number: "447483400327")
beth.photo.attach(io: URI.open('https://res.cloudinary.com/dkmmyz0gn/image/upload/v1624462456/flock%20seed%20file/beth_mu7ii8.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
beth.save!

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

puts "Creating a walk for Luisa"

luisa_walk = Walk.new(
  user_destination_id: dest2.id,
  buddy_destination_id: dest4.id,
  meeting_point: "Shoreditch, London",
  walk_request_status: "Accepted",
  pin: "BRG595"
)
luisa_walk.save!

puts "#{Walk.count} walks have been created"

puts "Creating reviews"

review1 = Review.create(
  user: rosi,
  reviewee: mai,
  rating: 5.0,
  )

review2 = Review.create(
  user: beth,
  reviewee: mai,
  rating: 5.0,
  )

review3 = Review.create(
  user: emma,
  reviewee: mai,
  rating: 4.0,
  )

review4 = Review.create(
  user: stephanie,
  reviewee: mai,
  rating: 5.0,
  )

review5 = Review.create(
  user: issy,
  reviewee: mai,
  rating: 5.0,
  )

review6 = Review.create(
  user: becky,
  reviewee: mai,
  rating: 5.0,
  )

review7 = Review.create(
  user: sasha,
  reviewee: mai,
  rating: 5.0,
  )

review8 = Review.create(
  user: joely,
  reviewee: mai,
  rating: 5.0,
  )

review9 = Review.create(
  user: luisa,
  reviewee: mai,
  rating: 5.0,
  )

review10 = Review.create(
  user: mai,
  reviewee: luisa,
  rating: 4.0,
  )

review11 = Review.create(
  user: mai,
  reviewee: rosi,
  rating: 4.0,
  )

review12 = Review.create(
  user: leyla,
  reviewee: rosi,
  rating: 4.0,
  )

review13 = Review.create(
  user: emily,
  reviewee: rosi,
  rating: 4.0,
  )

review14 = Review.create(
  user: joely,
  reviewee: rosi,
  rating: 5.0,
  )

puts "#{Review.count} review(s) have been created"

puts "Creating compliments"

compliment = Compliment.new(
    review_id: review1.id,
    content: "Nice conversation"
  )
compliment.save!

Compliment::COMPLIMENTS.shuffle.take(3).each do |compliment|
  Compliment.create(
    review: review1,
    content: compliment
    )
  end

Compliment::COMPLIMENTS.shuffle.take(2).each do |compliment|
  Compliment.create(
    review: review2,
    content: compliment
    )
  end

Compliment::COMPLIMENTS.shuffle.take(1).each do |compliment|
  Compliment.create(
    review: review3,
    content: compliment
    )
  end

puts "#{Compliment.count} compliments have been created"
