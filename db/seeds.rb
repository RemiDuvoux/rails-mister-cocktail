# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_hash = JSON.parse(open(url).read)
  ingredients_hash["drinks"].each do |ingredient|
  ingredient_new = Ingredient.create!(name: ingredient["strIngredient1"])
end

 # t.string   "description"
 #    t.integer  "ingredient_id"
 #    t.integer  "cocktail_id"
