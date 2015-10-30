class ProfileController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
    @created_recipes = current_user.created_recipes
    @saved_recipes = current_user.saved_recipes
    @liked_recipes = current_user.liked_recipes
    @cooked_masterpieces = current_user.cooked_masterpieces
    @liked_masterpieces = current_user.liked_masterpieces
  end
end
