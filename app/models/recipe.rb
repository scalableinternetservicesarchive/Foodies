class Recipe < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :creator, :title, presence: true
end
