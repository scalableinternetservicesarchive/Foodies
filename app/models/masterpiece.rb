class Masterpiece < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :cook, foreign_key: 'user_id', class_name: 'User'

  validates :recipe, :cook, presence: true
end
