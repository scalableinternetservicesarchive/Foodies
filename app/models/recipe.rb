class Recipe < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :steps, dependent: :destroy
  has_many :masterpieces
  has_many :cooks, through: :masterpieces, source: :cook
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients, source: :ingredient
  has_many :user_like_recipes
  has_many :users_liking_it, through: :user_like_recipes, source: :user
  has_many :user_save_recipes
  has_many :users_saving_it, through: :user_save_recipes, source: :user
  has_attached_file :recipe_img, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  accepts_nested_attributes_for :ingredients, reject_if: :find_ingredient, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true

  validates :creator, :title, presence: true
  validates_attachment_content_type :recipe_img, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def find_ingredient(ingredient)
    if existing_ingredient = Ingredient.find_by_name(ingredient['name'])
      unless self.ingredients.include?(existing_ingredient)
        self.ingredients << existing_ingredient
      end
      return true
    else
      return false
    end
  end

end
