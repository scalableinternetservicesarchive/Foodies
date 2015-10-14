class User < ActiveRecord::Base
  has_many :created_recipes, foreign_key: 'user_id', class_name: 'Recipe', dependent: :destroy
  has_many :cooked_masterpieces, foreign_key: 'user_id', class_name: 'Masterpiece'
  has_many :cooked_recipes, through: :cooked_masterpieces, source: :recipe

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
