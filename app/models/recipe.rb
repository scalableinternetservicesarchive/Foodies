class Recipe < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :steps, dependent: :destroy

  validates :creator, :title, presence: true
end
