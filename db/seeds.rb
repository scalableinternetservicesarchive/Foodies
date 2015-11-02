######################################
# Users
######################################

user1 = User.create(
  email: 'a@a.com',
  password: '88888888',
  password_confirmation: '88888888',
  avatar: URI.parse("https://octodex.github.com/images/pusheencat.png")
)

user2 = User.create(
  email: 'b@b.com',
  password: '88888888',
  password_confirmation: '88888888',
  avatar: URI.parse("https://octodex.github.com/images/dojocat.jpg")
)

user3 = User.create(
  email: 'c@c.com',
  password: '88888888',
  password_confirmation: '88888888',
  avatar: URI.parse("https://octodex.github.com/images/octobiwan.jpg")
)

######################################
# Recipes
######################################

recipe1 = Recipe.create(
  user_id: user1.id,
  title: 'Coke chicken wing',
  description: 'bla',
  cook_time: 30,
  recipe_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/recipe.jpg")
)

recipe2 = Recipe.create(
  user_id: user2.id,
  title: 'Potato salad',
  description: 'blabla',
  cook_time: 20,
  recipe_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/recipe.jpg")
)

######################################
# Masterpieces
######################################

masterpiece1_1 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece1.jpg")
)

masterpiece1_2 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece2.jpg")
)

masterpiece1_3 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece3.jpg")
)

masterpiece1_4 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece4.jpg")
)

masterpiece1_5 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece5.jpg")
)

masterpiece1_6 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece6.jpg")
)

masterpiece1_7 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece7.jpg")
)

masterpiece1_8 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece8.jpg")
)

masterpiece1_9 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece9.jpg")
)

masterpiece1_10 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece10.jpg")
)

masterpiece1_11 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece11.jpg")
)

masterpiece1_12 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/masterpiece12.jpg")
)

masterpiece2_1 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece1.jpg")
)

masterpiece2_2 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece2.jpg")
)

masterpiece2_3 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece3.jpg")
)

masterpiece2_4 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece4.jpg")
)

masterpiece2_5 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece5.jpg")
)

masterpiece2_6 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece6.jpg")
)

masterpiece2_7 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece7.jpg")
)

masterpiece2_8 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece8.jpg")
)

masterpiece2_9 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece9.jpg")
)

masterpiece2_10 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece10.jpg")
)

masterpiece2_11 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece11.jpg")
)

masterpiece2_12 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/masterpiece12.jpg")
)

######################################
# Steps
######################################

step1_1 = Step.create(
  recipe: recipe1,
  step_number: 1,
  description: '1st step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step1.jpg")
)

step1_2 = Step.create(
  recipe: recipe1,
  step_number: 2,
  description: '2nd step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step2.jpg")
)

step1_3 = Step.create(
  recipe: recipe1,
  step_number: 3,
  description: '3rd step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step3.jpg")
)

step1_4 = Step.create(
  recipe: recipe1,
  step_number: 4,
  description: '4th step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step4.jpg")
)

step1_5 = Step.create(
  recipe: recipe1,
  step_number: 5,
  description: '5th step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step5.jpg")
)

step1_6 = Step.create(
  recipe: recipe1,
  step_number: 6,
  description: '6th step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step6.jpg")
)

step1_7 = Step.create(
  recipe: recipe1,
  step_number: 7,
  description: '7th step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step7.jpg")
)

step1_8 = Step.create(
  recipe: recipe1,
  step_number: 8,
  description: '8th step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step8.jpg")
)

step1_9 = Step.create(
  recipe: recipe1,
  step_number: 9,
  description: '9th step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step9.jpg")
)

step1_10 = Step.create(
  recipe: recipe1,
  step_number: 10,
  description: '10th step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/coke-chicken-wing/step10.jpg")
)

step2_1 = Step.create(
  recipe: recipe2,
  step_number: 1,
  description: '1st step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/step1.jpg")
)

step2_2 = Step.create(
  recipe: recipe2,
  step_number: 2,
  description: '2nd step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/step2.jpg")
)

step3_3 = Step.create(
  recipe: recipe2,
  step_number: 3,
  description: '3rd step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/step3.jpg")
)

step2_4 = Step.create(
  recipe: recipe2,
  step_number: 4,
  description: '4th step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/step4.jpg")
)

step2_5 = Step.create(
  recipe: recipe2,
  step_number: 5,
  description: '5th step',
  step_img: URI.parse("https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/potato-salad/step5.jpg")
)

######################################
# Ingredients
######################################

ingredient1_1 = Ingredient.create(
  recipe: recipe1,
  name: 'ing1',
  quantity: '1g'
)

ingredient1_2 = Ingredient.create(
  recipe: recipe1,
  name: 'ing2',
  quantity: '1g'
)

ingredient1_3 = Ingredient.create(
  recipe: recipe1,
  name: 'ing3',
  quantity: '1g'
)

ingredient2_1 = Ingredient.create(
  recipe: recipe2,
  name: 'ing2',
  quantity: '1g'
)

ingredient2_2 = Ingredient.create(
  recipe: recipe2,
  name: 'ing4',
  quantity: '1g'
)

######################################
# User - Saved Recipes
######################################

user1.saved_recipes << [recipe1,recipe2]

######################################
# User - Liked Recipes
######################################

user1.liked_recipes << [recipe1]

######################################
# User - Liked Masterpieces
######################################

user1.liked_masterpieces << [masterpiece1_1,masterpiece1_2]
