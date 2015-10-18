# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(
  email: 'a@a.com',
  password: '88888888',
  password_confirmation: '88888888',
)

user2 = User.create(
  email: 'b@b.com',
  password: '88888888',
  password_confirmation: '88888888',
)

user3 = User.create(
  email: 'c@c.com',
  password: '88888888',
  password_confirmation: '88888888',
)

recipe1 = Recipe.create(
  user_id: user1.id,
  title: 'chicken wing',
  description: 'bla',
  cook_time: 30
)

recipe2 = Recipe.create(
  user_id: user2.id,
  title: 'duck wing',
  description: 'blabla',
  cook_time: 300
)

masterpiece1 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla'
)

masterpiece2 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user2.id,
  description: 'bla'
)

step1_1 = Step.create(
  recipe: recipe1,
  step_number: 1,
  description: 'first step'
)

step1_2 = Step.create(
  recipe: recipe1,
  step_number: 2,
  description: 'second step'
)

step1_3 = Step.create(
  recipe: recipe1,
  step_number: 3,
  description: 'third step'
)

step2_1 = Step.create(
  recipe: recipe2,
  step_number: 1,
  description: 'first step'
)

step2_2 = Step.create(
  recipe: recipe2,
  step_number: 2,
  description: 'second step'
)

step3_3 = Step.create(
  recipe: recipe2,
  step_number: 3,
  description: 'third step'
)

ingredient1 = Ingredient.create(
  name: 'ing1'
)
ingredient2 = Ingredient.create(
  name: 'ing2'
)
ingredient3 = Ingredient.create(
  name: 'ing3'
)
ingredient4 = Ingredient.create(
  name: 'ing4'
)

recipe1.ingredients << [ingredient1, ingredient2, ingredient3]
recipe2.ingredients << [ingredient2, ingredient4]
