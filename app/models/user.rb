class User < ActiveRecord::Base
  has_many :created_recipes, foreign_key: 'user_id', class_name: 'Recipe', dependent: :destroy
  has_many :cooked_masterpieces, foreign_key: 'user_id', class_name: 'Masterpiece'
  has_many :created_collections, foreign_key: 'user_id', class_name: 'Collection', dependent: :destroy

  has_many :cooked_recipes, through: :cooked_masterpieces, source: :recipe
  has_many :user_like_recipes
  has_many :liked_recipes, through: :user_like_recipes, source: :recipe
  has_many :user_save_recipes
  has_many :saved_recipes, through: :user_save_recipes, source: :recipe
  has_many :user_like_masterpieces
  has_many :liked_masterpieces, through: :user_like_masterpieces, source: :masterpiece
  has_many :user_save_collections
  has_many :saved_collections, through: :user_save_collections, source: :collection
  has_attached_file :avatar, styles: {
    tiny: '48x48#',
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, default_url: "/images/default/missing_:attachment_:style.jpg"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
