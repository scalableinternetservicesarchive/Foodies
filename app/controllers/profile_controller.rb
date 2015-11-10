class ProfileController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
    @created_recipes = current_user.created_recipes
    @bookmarked_recipes = current_user.bookmarked_recipes
    @liked_recipes = current_user.liked_recipes
    @cooked_masterpieces = current_user.cooked_masterpieces
    @liked_masterpieces = current_user.liked_masterpieces
  end
end
