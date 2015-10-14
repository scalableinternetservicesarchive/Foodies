class UserLikeMasterpiece < ActiveRecord::Base
  belongs_to :user
  belongs_to :masterpiece

  validates :user, :masterpiece, presence: true
end
