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
require 'net/http'
require 'json'

# "créer un user par défaut"
# user = User.create!(
#   email: 'thedoctor@tardis.fr',
#   password: 'rosetyler',
#   first_name: '??????',
#   last_name: '??????',
#   nickname: 'The Doctor',
#   is_public: false,
#   picture: 'https://media.cnn.com/api/v1/images/stellar/prod/221024162639-david-tennant.jpg'
# )

# puts "#{user.nickname} est dans la base de donnée" if user.persisted?

# # "créer un hideout par défaut"
# hideout = Hideout.create!(
#   address: 'Everywhere, at all 1',
#   price: 2500,
#   overview: "Time and Relative Dimensions in Space, but it's the iconic one! ",
#   user: User.last,
#   title: 'The Tardis 2',
#   cover_picture: 'https://cms.doctorwho.tv/sites/default/files/2022-03/TARDIS%20-%201920x1080.png'
# )

# puts "ainsi que sa base : #{hideout.title}" if hideout.persisted?

puts "importing user database..."

def seed_user_profile(id)
  url = URI("https://www.superheroapi.com/api.php/63c9ba9221026d6fea0b328f7f75a977/#{id}") # with api key
  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  if data["response"] == 'success' # l'api répond success seulement si un personnage est associé à l'ID
    # puts data # debug
    puts "Generating #{data['name']}'s account"
    if data.dig('biography', 'full-name').empty?
      first_name = "???"
      last_name = "???"
      usermail = data['name'].split.first.downcase
    else
      first_name = data.dig('biography', 'full-name').split.first
      last_name = data.dig('biography', 'full-name').split.last
      usermail = "#{first_name.downcase}.#{last_name.downcase}"
    end

    if data.dig('connections', 'group-affiliation').nil? || data.dig('connections', 'group-affiliation').strip.length <= 2
      domain = "gmail"
    else
      words = data.dig('connections', 'group-affiliation').split
      if words.first.downcase == "formerly" || words.first.downcase == "member"
        domain = words[1].downcase if words.length > 1
      else
        domain = words.first.downcase
      end
      domain = domain.delete(',')
      domain = domain.delete('-')
      domain = domain.delete('_')
      domain = domain.delete(':')
      domain = domain.delete(';')
      domain = domain.delete('@')
      domain = domain.delete(')')
      domain = domain.delete('(')
      domain = domain.delete(']')
      domain = domain.delete('[')
      domain = domain.delete('{')
      domain = domain.delete('}')
    end

    puts "#{usermail}@#{domain}.com",
    new_user = User.create!({
      nickname: data['name'],
      first_name: first_name,
      last_name: last_name,
      # home: data.dig('work', 'base'), # potentiellement inutilse, mais cool de l'avoir au cas ou
      password: "azerty",
      email: "#{usermail}@#{domain}.com",
      picture: data.dig('image', 'url'),
      is_public: false
    })
    puts "#{new_user.nickname} a été ajouté à la base de donnée" if new_user.persisted?
  else
    [] # current_id += 1   if response != success une boucle en plus
    puts "il n'y a pas d'utilisateur associé à l'id #{id} à ajouté à la base de donnée"
  end
end

unique_ids = (1..732).to_a.sample(100)
unique_ids.each do |id|
  seed_user_profile(id)
end

puts "Seeding complete! #{User.count} users were imported!"
