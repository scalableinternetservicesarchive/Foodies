class CollectionRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :collection

  validates :recipe, :collection, presence: true
end
