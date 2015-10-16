class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, :ingredient, presence: true
end
