require 'json'
require 'open-uri'
require 'faker'
puts "Cleaning DB"
Ingredient.destroy_all
Cocktail.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating ingredients..."
result = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = result['drinks']
drinks.each do |hash|
  hash.each do |key, ingredient|
    Ingredient.create(name: ingredient)
  end
end

puts "Created #{Ingredient.count} ingredients"

# sleep 01

# puts "Creating cocktails..."

# 30.times do
# Cocktail.create!(
# name: Faker::Games::Pokemon.move
# )
# end

# puts "Created #{Cocktail.count} cocktails"
