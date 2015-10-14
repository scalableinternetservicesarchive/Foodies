class Recipe < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :steps, dependent: :destroy
  has_many :masterpieces
  has_many :cooks, through: :masterpieces, source: :cook

  validates :creator, :title, presence: true
end
