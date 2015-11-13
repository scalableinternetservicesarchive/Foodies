class Masterpiece < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :cook, foreign_key: 'user_id', class_name: 'User'
  has_many :user_like_masterpieces, dependent: :destroy
  has_many :users_liking_it, through: :user_like_masterpieces, source: :user
  has_attached_file :masterpiece_img, styles: {
    thumb: '100x100#',
    square: '200x200#',
    medium: '300x300#'
  }, default_url: "/images/default/missing_:attachment_:style.jpg"
  validates :recipe, :cook, presence: true
  validates_attachment_content_type :masterpiece_img, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
