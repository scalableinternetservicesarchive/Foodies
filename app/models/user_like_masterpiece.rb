class UserLikeMasterpiece < ActiveRecord::Base
  belongs_to :user, counter_cache: :liked_masterpiece_count
  belongs_to :masterpiece, counter_cache: :user_like_count

  validates :user, :masterpiece, presence: true
end
