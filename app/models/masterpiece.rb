class Masterpiece < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :cook, foreign_key: 'user_id', class_name: 'User'
  has_many :user_like_masterpieces
  has_many :users_liking_it, through: :user_like_masterpieces, source: :user

  validates :recipe, :cook, presence: true
end
