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

puts 'Creating fake ingredients...'

i = 1
30.times do
  ingredient = Ingredient.new(
    name: Faker::Food.ingredient
  )
  if ingredient.save
  else
    next
  end
  i += 1
end

puts "Finished the Ingredient! #{Ingredient.all.count}"

puts 'Creating faker Cocktails...'

i = 1
20.times do
  cocktail = Cocktail.new(
    name: Faker::Movie.quote
  )
  if cocktail.save
     else
    next
  end
  i += 1
end
puts "Finished the Cocktails! #{Cocktail.all.count}"

puts 'Creating fake doses...'

Cocktail.all.each do |cocktail|
  i = 1
    dose = Dose.new(
      description: Faker::Food.measurement,
      cocktail_id: cocktail.id,
      ingredient_id: (1...50).to_a.sample
    )
    if dose.save
       else
    next
    end
    i += 1

end

puts 'Finished the doses!'

puts 'Finished all seed!'
