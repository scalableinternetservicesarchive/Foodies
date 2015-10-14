class Ingredient < ActiveRecord::Base
  validates :name, presence: true
end
