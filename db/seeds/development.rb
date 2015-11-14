# Usually this seed takes 2 minutes

######################################
# config
######################################

# max of total_num_of_users = 26
total_num_of_users = 5
# max of total_num_of_recipes = 12
total_num_of_recipes = 12
# total_num_of_masterpieces is calculated later
total_num_of_masterpieces = 0

image_base_url = "https://dl.dropboxusercontent.com/u/84778126/foodies/seed-images/"

user_avatar_urls = [
  "https://octodex.github.com/images/pusheencat.png",              #user1
  "https://octodex.github.com/images/dojocat.jpg",                 #user2
  "https://octodex.github.com/images/octobiwan.jpg",               #user3
  "https://octodex.github.com/images/constructocat2.jpg",          #user4
  "https://octodex.github.com/images/kimonotocat.png",             #user5
  "https://octodex.github.com/images/mountietocat.png",            #user6
  "https://octodex.github.com/images/spidertocat.png",             #user7
  "https://octodex.github.com/images/stormtroopocat.jpg",          #user8
  "https://octodex.github.com/images/droidtocat.png",              #user9
  "https://octodex.github.com/images/red-polo.png",                #user10
  "https://octodex.github.com/images/thanktocat.jpg",              #user11
  "https://octodex.github.com/images/octocat-de-los-muertos.jpg",  #user12
  "https://octodex.github.com/images/cherryontop-o-cat.jpg",       #user13
  "https://octodex.github.com/images/privateinvestocat.jpg",       #user14
  "https://octodex.github.com/images/ironcat.jpg",                 #user15
  "https://octodex.github.com/images/inspectocat.jpg",             #user16
  "https://octodex.github.com/images/scarletteocat.jpg",           #user17
  "https://octodex.github.com/images/oktobercat.jpg",              #user18
  "https://octodex.github.com/images/waldocat.png",                #user19
  "https://octodex.github.com/images/plumber.jpg",                 #user20
  "https://octodex.github.com/images/linktocat.jpg",               #user21
  "https://octodex.github.com/images/megacat.jpg",                 #user22
  "https://octodex.github.com/images/saint-nicktocat.jpg",         #user23
  "https://octodex.github.com/images/snowoctocat.jpg",             #user24
  "https://octodex.github.com/images/minion.png",                  #user25
  "https://octodex.github.com/images/steroidtocat.png"             #user26
]

recipes_config = [
  {
    recipe_base_url: "coke-chicken-wing",
    num_of_steps: 10,
    num_of_masterpieces: 12,
    ingredient_list: "chicken wing, coke",
    tag_list: "chicken wing, coke"
  },
  {
    recipe_base_url: "potato-salad",
    num_of_steps: 5,
    num_of_masterpieces: 12,
    ingredient_list: "potato",
    tag_list: "potato, salad"
  },
  {
    recipe_base_url: "cherry-blossom-mousse",
    num_of_steps: 11,
    num_of_masterpieces: 6,
    ingredient_list: "cherry blossom",
    tag_list: "mousse, cherry blossom, dessert"
  },
  {
    recipe_base_url: "grape-fruit-jam",
    num_of_steps: 0,
    num_of_masterpieces: 0,
    ingredient_list: "grape fruit",
    tag_list: "grape fruit, jam"
  },
  {
    recipe_base_url: "honey-grape-fruit-tea",
    num_of_steps: 0,
    num_of_masterpieces: 0,
    ingredient_list: "grape fruit, honey",
    tag_list: "grape fruit, honey, tea"
  },
  {
    recipe_base_url: "sweet-grape-fruit-peel",
    num_of_steps: 0,
    num_of_masterpieces: 0,
    ingredient_list: "grape fruit",
    tag_list: "grape fruit"
  },
  {
    recipe_base_url: "grape-fruit-totoro",
    num_of_steps: 0,
    num_of_masterpieces: 0,
    ingredient_list: "grape fruit",
    tag_list: "grape fruit, fun"
  },
  {
    recipe_base_url: "saute-grape-fruit",
    num_of_steps: 0,
    num_of_masterpieces: 0,
    ingredient_list: "grape fruit",
    tag_list: "grape fruit"
  },
  {
    recipe_base_url: "grape-fruit-soda",
    num_of_steps: 0,
    num_of_masterpieces: 0,
    ingredient_list: "grape fruit, water",
    tag_list: "grape fruit, drink"
  },
  {
    recipe_base_url: "grape-fruit-ice-cream",
    num_of_steps: 0,
    num_of_masterpieces: 0,
    ingredient_list: "grape fruit",
    tag_list: "grape fruit, ice cream"
  },
  {
    recipe_base_url: "rio-cocktail-ice-pop",
    num_of_steps: 0,
    num_of_masterpieces: 0,
    ingredient_list: "cocktail, water",
    tag_list: "cocktail, ice pop"
  },
  {
    recipe_base_url: "fry-potato-button",
    num_of_steps: 0,
    num_of_masterpieces: 0,
    ingredient_list: "potato",
    tag_list: "potato, fry, fun"
  },
]

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
  p 'Creating user: user_' + (n_user + 1).to_s
  user = User.create(
    username: "user_" + (n_user + 1).to_s,
    email: "user_" + (n_user + 1).to_s + "@example.com",
    password: "88888888",
    password_confirmation: "88888888",
    avatar: URI.parse(user_avatar_urls[n_user])
  )
end

######################################
# create recipes
######################################

total_num_of_recipes.times do |n_recipe|
  p 'Creating recipe: ' + recipes_config[n_recipe][:recipe_base_url]
  recipe = Recipe.create(
    user_id: rand(total_num_of_users) + 1,
    title: recipes_config[n_recipe][:recipe_base_url].gsub('-',' ').camelize,
    description: Faker::Lorem.sentence(6),
    cook_time: (rand(6) + 1) * 10,
    recipe_img: URI.parse(image_base_url + recipes_config[n_recipe][:recipe_base_url] + "/recipe.jpg"),
    tag_list: recipes_config[n_recipe][:tag_list]
  )

  ######################################
  # add ingredients to each recipe
  ######################################

  p '- Adding ingredients'
  ingredient_names = recipes_config[n_recipe][:ingredient_list].split(',')
  ingredient_names.each do |ingredient_name|
    ingredient = Ingredient.create(
      recipe_id: n_recipe + 1,
      name: ingredient_name,
      quantity: ((rand(50) + 1) * 10).to_s + 'g'
    )
  end

  ######################################
  # add steps to each recipe
  ######################################

  p '- Adding steps'
  num_of_steps = recipes_config[n_recipe][:num_of_steps]
  num_of_steps.times do |n_step|
    step = Step.create(
      recipe_id: n_recipe + 1,
      step_number: n_step + 1,
      description: Faker::Lorem.sentence(6),
      step_img: URI.parse(image_base_url + recipes_config[n_recipe][:recipe_base_url] + "/step" + (n_step + 1).to_s + ".jpg")
    )
  end

  ######################################
  # add masterpieces to each recipe
  ######################################

  p '- Adding masterpieces'
  num_of_masterpieces = recipes_config[n_recipe][:num_of_masterpieces]
  num_of_masterpieces.times do |n_masterpiece|
    p '  - Creating masterpiece ' + (n_masterpiece + 1).to_s
    masterpiece = Masterpiece.create(
      recipe_id: n_recipe + 1,
      user_id: rand(total_num_of_users) + 1,
      description: Faker::Lorem.sentence(6),
      masterpiece_img: URI.parse(image_base_url + recipes_config[n_recipe][:recipe_base_url] + "/masterpiece" + (n_masterpiece + 1).to_s + ".jpg")
    )
    total_num_of_masterpieces += 1
  end

end

recipe_ids_array = (1..total_num_of_recipes).to_a
masterpiece_ids_array = (1..total_num_of_masterpieces).to_a

total_num_of_users.times do |n_user|
  p 'User' + (n_user + 1).to_s

  ######################################
  # user like recipes
  ######################################

  p '- likes recipes'
  user_like_recipe_count = rand(total_num_of_recipes)
  recipe_ids_array.sample(user_like_recipe_count).each do |recipe_id|
    user_like_recipe(n_user + 1, recipe_id)
  end

  ######################################
  # user bookmark recipes
  ######################################

  p '- bookmarks recipes'
  user_bookmark_recipe_count = rand(total_num_of_recipes)
  recipe_ids_array.sample(user_bookmark_recipe_count).each do |recipe_id|
    user_bookmark_recipe(n_user + 1, recipe_id)
  end

  ######################################
  # user like masterpieces
  ######################################

  p '- likes masterpieces'
  user_like_masterpiece_count = rand(total_num_of_masterpieces)
  masterpiece_ids_array.sample(user_like_masterpiece_count).each do |masterpiece_id|
    user_like_masterpiece(n_user + 1, masterpiece_id)
  end
end
