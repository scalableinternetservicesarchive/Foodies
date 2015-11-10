class UserBookmarkRecipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe, counter_cache: :user_bookmark_count

  validates :user, :recipe, presence: true
end
