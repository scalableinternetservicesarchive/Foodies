class Recipe < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :steps, dependent: :destroy
  has_many :masterpieces
  has_many :cooks, through: :masterpieces, source: :cook
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients, source: :ingredient
  has_many :user_like_recipes
  has_many :users_liking_it, through: :user_like_recipes, source: :user

  validates :creator, :title, presence: true
end
