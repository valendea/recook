# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# => => ["id", "email", "password_digest", "created_at", "updated_at", "first_name", "last_name"]

# require 'faker'

# Seed Users
user = {}
user['password'] = '1234567'
user['password_confirmation'] = '1234567'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end

# # Seed Recipes
recipe = {}
uids = []
Recipe.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    recipe['title'] = Faker::Food.dish
    recipe['description'] = Faker::Hipster.sentence
    recipe['ingredients'] = Faker::Food.ingredient
    recipe['steps'] = ["- Preheat a waffle iron.\r\n- Beat together eggs and sugar with an electric mixer until fluffy. Pour in shortening, milk, salt, and vanilla; mix until well blended. Sift together the flour and baking powder. Mix the flour into the liquid.\r\n- Spoon 2/3 cup of batter onto the preheated waffle iron at a time. Close the iron and cook until steam no is no longer coming out and waffle is browned."]

    recipe['user_id'] = uids.sample

    Recipe.create(recipe)
  end
end