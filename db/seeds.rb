# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Créez un utilisateur "Iron Man"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# "The Doctor"
user = User.create!(
  email: 'thedoctor@tardis.io',
  password: 'rosetyler',
  first_name: '??????',
  last_name: '??????',
  nickname: 'The Doctor',
  is_public: false,
  picture: 'https://media.cnn.com/api/v1/images/stellar/prod/221024162639-david-tennant.jpg'
)

puts "#{user.nickname} est dans la base de donnée" if user.persisted?

# "Tardis"
hideout = Hideout.create!(
  address: 'Everywhere, at all time, mostly 21th century London',
  price: 2500,
  overview: "Time and Relative Dimensions in Space, but it's the iconic one! ",
  user_id: user.id,
  title: 'The Tardis',
  cover_picture: 'https://cms.doctorwho.tv/sites/default/files/2022-03/TARDIS%20-%201920x1080.png'
)

puts "ainsi que sa base : #{hideout.title}" if hideout.persisted?
