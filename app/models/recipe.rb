class Recipe < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :masterpieces, dependent: :destroy
  has_many :cooks, through: :masterpieces, source: :cook
  has_many :user_like_recipes
  has_many :users_liking_it, through: :user_like_recipes, source: :user
  has_many :user_save_recipes
  has_many :users_saving_it, through: :user_save_recipes, source: :user

  has_many :collection_recipes
  has_many :collections, through: :collection_recipes, source: :collection

  has_attached_file :recipe_img, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    slide: '1120x400#'
  }, default_url: "/images/default/missing_:attachment_:style.jpg"
  acts_as_taggable_on :tags
  accepts_nested_attributes_for :ingredients, reject_if: lambda { |a| a[:name].blank?}, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true

  validates :creator, :title, presence: true
  validates_attachment_content_type :recipe_img, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.search(search)
     search_condition = "%"+search+"%"
     where("title LIKE ? OR description LIKE ?  ",  search_condition, search_condition)
  end

end
