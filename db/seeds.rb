# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Compliment.create!([
  { message: "You're doing great!" },
  { message: "You have an amazing smile!" },
  { message: "You're incredibly talented!" },
  { message: "You're a fantastic friend!" },
  { message: "You brighten everyone's day!" }
])
