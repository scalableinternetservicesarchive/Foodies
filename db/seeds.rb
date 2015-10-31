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
  recipe_img: URI.parse("http://www.imageurlhost.com/images/80052708509399117808.jpg")
)

recipe2 = Recipe.create(
  user_id: user2.id,
  title: 'Potato salad',
  description: 'blabla',
  cook_time: 20,
  recipe_img: URI.parse("http://www.imageurlhost.com/images/33376778888252021013.jpg")
)

######################################
# Masterpieces
######################################

masterpiece1_1 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/60571547910001905498.jpg")
)

masterpiece1_2 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/04116633018119509978.jpg")
)

masterpiece1_3 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/25901490338550096001.jpg")
)

masterpiece1_4 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/97266516363949677432.jpg")
)

masterpiece1_5 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/46193640565962370040.jpg")
)

masterpiece1_6 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/97723895805828284800.jpg")
)

masterpiece1_7 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/59417174510858974243.jpg")
)

masterpiece1_8 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/31197214092826924167.jpg")
)

masterpiece1_9 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/67168390124798395305.jpg")
)

masterpiece1_10 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/52794532810164013125.jpg")
)

masterpiece1_11 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/90668614194007849074.jpg")
)

masterpiece1_12 = Masterpiece.create(
  recipe_id: recipe1.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/69931161954049488256.jpg")
)

masterpiece2_1 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/19273872377606369218.jpg")
)

masterpiece2_2 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/27040355680435281019.jpg")
)

masterpiece2_3 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/94140076343246839157.jpg")
)

masterpiece2_4 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/34055181828694918152.jpg")
)

masterpiece2_5 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/26239789808033017668.jpg")
)

masterpiece2_6 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/41235530667955568884.jpg")
)

masterpiece2_7 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/30029436193233167979.jpg")
)

masterpiece2_8 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/58498360359494724748.jpg")
)

masterpiece2_9 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/21051815963216196924.jpg")
)

masterpiece2_10 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/07741699504608802283.jpg")
)

masterpiece2_11 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/56463250027462940587.jpg")
)

masterpiece2_12 = Masterpiece.create(
  recipe_id: recipe2.id,
  user_id: user1.id,
  description: 'bla',
  masterpiece_img: URI.parse("http://www.imageurlhost.com/images/65505005449304819533.jpg")
)

######################################
# Steps
######################################

step1_1 = Step.create(
  recipe: recipe1,
  step_number: 1,
  description: '1st step',
  step_img: URI.parse("http://www.imageurlhost.com/images/80012821747165129279.jpg")
)

step1_2 = Step.create(
  recipe: recipe1,
  step_number: 2,
  description: '2nd step',
  step_img: URI.parse("http://www.imageurlhost.com/images/77262038880692233811.jpg")
)

step1_3 = Step.create(
  recipe: recipe1,
  step_number: 3,
  description: '3rd step',
  step_img: URI.parse("http://www.imageurlhost.com/images/88839561625776765455.jpg")
)

step1_4 = Step.create(
  recipe: recipe1,
  step_number: 4,
  description: '4th step',
  step_img: URI.parse("http://www.imageurlhost.com/images/36751561955583737419.jpg")
)

step1_5 = Step.create(
  recipe: recipe1,
  step_number: 5,
  description: '5th step',
  step_img: URI.parse("http://www.imageurlhost.com/images/93879817173204847206.jpg")
)

step1_6 = Step.create(
  recipe: recipe1,
  step_number: 6,
  description: '6th step',
  step_img: URI.parse("http://www.imageurlhost.com/images/30058540844854569807.jpg")
)

step1_7 = Step.create(
  recipe: recipe1,
  step_number: 7,
  description: '7th step',
  step_img: URI.parse("http://www.imageurlhost.com/images/76354797207555491849.jpg")
)

step1_8 = Step.create(
  recipe: recipe1,
  step_number: 8,
  description: '8th step',
  step_img: URI.parse("http://www.imageurlhost.com/images/85143970231186483133.jpg")
)

step1_9 = Step.create(
  recipe: recipe1,
  step_number: 9,
  description: '9th step',
  step_img: URI.parse("http://www.imageurlhost.com/images/23375861747960599176.jpg")
)

step1_10 = Step.create(
  recipe: recipe1,
  step_number: 10,
  description: '10th step',
  step_img: URI.parse("http://www.imageurlhost.com/images/33331801913532968047.jpg")
)

step2_1 = Step.create(
  recipe: recipe2,
  step_number: 1,
  description: '1st step',
  step_img: URI.parse("http://www.imageurlhost.com/images/24308748469787450609.jpg")
)

step2_2 = Step.create(
  recipe: recipe2,
  step_number: 2,
  description: '2nd step',
  step_img: URI.parse("http://www.imageurlhost.com/images/49281453664256166078.jpg")
)

step3_3 = Step.create(
  recipe: recipe2,
  step_number: 3,
  description: '3rd step',
  step_img: URI.parse("http://www.imageurlhost.com/images/61549442371203298119.jpg")
)

step2_4 = Step.create(
  recipe: recipe2,
  step_number: 4,
  description: '4th step',
  step_img: URI.parse("http://www.imageurlhost.com/images/41404205906500914728.jpg")
)

step2_5 = Step.create(
  recipe: recipe2,
  step_number: 5,
  description: '5th step',
  step_img: URI.parse("http://www.imageurlhost.com/images/72424936302482545506.jpg")
)

######################################
# Ingredients
######################################

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

######################################
# Recipe - Ingredient
######################################

recipe1.ingredients << [ingredient1, ingredient2, ingredient3]
recipe2.ingredients << [ingredient2, ingredient4]

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
