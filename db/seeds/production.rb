######################################
# config
######################################

# allow_image_upload = true && total_num_of_users = 20         -- 3 min
# allow_image_upload = true && total_num_of_users = 50         -- 7 min
# allow_image_upload = false && total_num_of_users = 50        -- 1 min
# allow_image_upload = false && total_num_of_users = 500       -- 5 min
require 'faker'

allow_randomness = false
allow_image_upload = false

total_num_of_users = 500
total_num_of_recipes = 0        # total_num_of_recipes is calculated later
total_num_of_masterpieces = 0   # total_num_of_masterpieces is calculated later
total_num_of_tags = 100
total_num_of_ingredients = 50

avg_num_of_recipes_per_user = 2
avg_num_of_masterpieces_per_user = 4
avg_num_of_liked_recipes_per_user = 20
avg_num_of_bookmarked_recipes_per_user = 10
avg_num_of_liked_masterpieces_per_user = 20

avg_num_of_tags_per_recipe = 3
avg_num_of_ingredients_per_recipe = 3
avg_num_of_steps_per_recipe = 2


tags_array = (1..total_num_of_tags).to_a
tags_array.map! { |x| "tag" + x.to_s }

ingredients_array = (1..total_num_of_ingredients).to_a
ingredients_array.map! { |x| "ingredient" + x.to_s }

sample_avatar_file = File.new("#{Rails.root}/load_tests/sample_avatar.png")
sample_recipe_img_file = File.new("#{Rails.root}/load_tests/sample_recipe_img.jpg")
sample_step_img_file = File.new("#{Rails.root}/load_tests/sample_step_img.png")
sample_masterpiece_img_file = File.new("#{Rails.root}/load_tests/sample_masterpiece_img.jpg")

######################################
# util functions
######################################

def user_like_recipe(user_id, recipe_id)
  UserLikeRecipe.create(
    user_id: user_id,
    recipe_id: recipe_id
  )
end

def user_bookmark_recipe(user_id, recipe_id)
  UserBookmarkRecipe.create(
    user_id: user_id,
    recipe_id: recipe_id
  )
end

def user_like_masterpiece(user_id, masterpiece_id)
  UserLikeMasterpiece.create(
    user_id: user_id,
    masterpiece_id: masterpiece_id
  )
end

######################################
# create users
######################################

total_num_of_users.times do |n_user|
  puts 'Creating user: user_' + (n_user + 1).to_s
  user = User.create(
    username: "user_" + (n_user + 1).to_s,
    email: "user_" + (n_user + 1).to_s + "@example.com",
    password: "88888888",
    password_confirmation: "88888888",
    avatar: allow_image_upload ? sample_avatar_file : nil
  )
end

######################################
# user create recipes
######################################
total_num_of_users.times do |n_user|
  user_id = n_user + 1
  puts 'User ' + user_id.to_s + ' creates recipes'
  num_of_recipes = allow_randomness ? rand(avg_num_of_recipes_per_user * 2 + 1) : avg_num_of_recipes_per_user

  num_of_recipes.times do

    ######################################
    # create recipe
    ######################################

    num_of_tags = allow_randomness ? rand(avg_num_of_tags_per_recipe * 2 + 1) : avg_num_of_tags_per_recipe

    recipe = Recipe.create(
      user_id: user_id,
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.sentence,
      cook_time: (rand(6) + 1) * 10,
      recipe_img: allow_image_upload ? sample_recipe_img_file : nil,
      tag_list: tags_array.sample(num_of_tags)
    )

    recipe_id = recipe.id

    puts 'Created recipe:' + recipe_id.to_s

    ######################################
    # add ingredients to each recipe
    ######################################

    puts '- Adding ingredients'
    num_of_ingredients = allow_randomness ? rand(avg_num_of_ingredients_per_recipe * 2 + 1) : avg_num_of_ingredients_per_recipe
    ingredients_array.sample(num_of_ingredients).each do |ingredient_name|
      ingredient = Ingredient.create(
        recipe_id: recipe_id,
        name: ingredient_name,
        quantity: ((rand(50) + 1) * 10).to_s + 'g'
      )
    end

    ######################################
    # add steps to each recipe
    ######################################

    puts '- Adding steps'
    num_of_steps = allow_randomness ? rand(avg_num_of_steps_per_recipe * 2 + 1) : avg_num_of_steps_per_recipe
    num_of_steps.times do |n_step|
      step = Step.create(
        recipe_id: recipe_id,
        step_number: n_step + 1,
        description: Faker::Lorem.sentence,
        step_img: allow_image_upload ? sample_step_img_file : nil
      )
    end

    total_num_of_recipes += 1

  end

end

recipe_ids_array = (1..total_num_of_recipes).to_a

######################################
# user create masterpieces
######################################
total_num_of_users.times do |n_user|
  user_id = n_user + 1
  puts 'User ' + user_id.to_s + ' creates masterpieces'
  num_of_masterpieces = allow_randomness ? rand(avg_num_of_masterpieces_per_user * 2 + 1) : avg_num_of_masterpieces_per_user
  recipe_ids_array.sample(num_of_masterpieces).each do |recipe_id|
    puts '- adding masterpiece to recipe:' + recipe_id.to_s
    masterpiece = Masterpiece.create(
      recipe_id: recipe_id,
      user_id: user_id,
      description: Faker::Lorem.sentence,
      masterpiece_img: allow_image_upload ? sample_masterpiece_img_file : nil
    )
    total_num_of_masterpieces += 1
  end
end

masterpiece_ids_array = (1..total_num_of_masterpieces).to_a

total_num_of_users.times do |n_user|
  user_id = n_user + 1
  puts 'User' + user_id.to_s

  ######################################
  # user like recipes
  ######################################

  puts '- likes recipes'
  user_like_recipe_count = allow_randomness ? rand(avg_num_of_liked_recipes_per_user * 2 + 1) : avg_num_of_liked_recipes_per_user
  recipe_ids_array.sample(user_like_recipe_count).each do |recipe_id|
    user_like_recipe(user_id, recipe_id)
  end

  ######################################
  # user bookmark recipes
  ######################################

  puts '- bookmarks recipes'
  user_bookmark_recipe_count = allow_randomness ? rand(avg_num_of_bookmarked_recipes_per_user * 2 + 1) : avg_num_of_bookmarked_recipes_per_user
  recipe_ids_array.sample(user_bookmark_recipe_count).each do |recipe_id|
    user_bookmark_recipe(user_id, recipe_id)
  end

  ######################################
  # user like masterpieces
  ######################################

  puts '- likes masterpieces'
  user_like_masterpiece_count = allow_randomness ? rand(avg_num_of_liked_masterpieces_per_user * 2 + 1) : avg_num_of_liked_masterpieces_per_user
  masterpiece_ids_array.sample(user_like_masterpiece_count).each do |masterpiece_id|
    user_like_masterpiece(user_id, masterpiece_id)
  end
end

puts '===='
puts 'Total number of recipes: ' + total_num_of_recipes.to_s
puts 'Total number of masterpieces: ' + total_num_of_masterpieces.to_s
