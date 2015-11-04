class UserSaveCollection < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection

  validates :user, :collection, presence: true
end
