class UserLikeRecipe < ActiveRecord::Base
  belongs_to :user, counter_cache: :liked_recipe_count
  belongs_to :recipe, counter_cache: :user_like_count

  validates :user, :recipe, presence: true
end
