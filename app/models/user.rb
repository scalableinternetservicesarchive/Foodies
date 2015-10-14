class User < ActiveRecord::Base
  has_many :created_recipes, foreign_key: 'user_id', class_name: 'Recipe', dependent: :destroy
  has_many :cooked_masterpieces, foreign_key: 'user_id', class_name: 'Masterpiece'
  has_many :cooked_recipes, through: :cooked_masterpieces, source: :recipe
  has_many :user_like_recipes
  has_many :liked_recipes, through: :user_like_recipes, source: :recipe
  has_many :user_save_recipes
  has_many :saved_recipes, through: :user_save_recipes, source: :recipe
  has_many :user_like_masterpieces
  has_many :liked_masterpieces, through: :user_like_masterpieces, source: :masterpiece

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
