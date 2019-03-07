# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning database...'
Ingredient.destroy_all
Dose.destroy_all
Cocktail.destroy_all

puts 'Creating 50 faker ingredients...'

i = 1
50.times do
  ingredient = Ingredient.new(
    name: Faker::Food.ingredient
  )
  ingredient.save!
  i += 1
end

puts 'Finished the Ingredient!'

puts 'Creating 20 faker Cocktails...'

i = 1
20.times do
  cocktail = Cocktail.new(
    name: Faker::Movie.quote
  )
  cocktail.save!
  i += 1
end
puts 'Finished the Cocktails!'

puts 'Creating 70 fake doses...'

Cocktail.all.each do |cocktail|
  i = 1
  num = (1...4).rand
  num.times do
    dose = Dose.new(
      name: Faker::Food.measurement,
      cocktail_id: cocktail.id,
      ingredient_id: (1...50).sample
    )
    dose.save!
    i += 1
  end
end

puts 'Finished the doses!'

puts 'Finished all seed!'
