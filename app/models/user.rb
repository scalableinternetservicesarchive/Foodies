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
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.search(search)
    search_condition = "%"+search+"%"
    where("email LIKE ?  ",  search_condition)
  end

  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    } # etc.
  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /\A[a-zA-Z0-9_\.]*\z/
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
    conditions[:email].downcase! if conditions[:email]
    where(conditions.to_h).first
  end
end
