class ProfileController < ApplicationController
  def show
    @user = User.select('id, username, email, avatar_file_name, created_at').find(params[:id])
    @created_recipes = @user.created_recipes
    @bookmarked_recipes = @user.bookmarked_recipes
    @liked_recipes = @user.liked_recipes
    @cooked_masterpieces = @user.cooked_masterpieces
    @liked_masterpieces = @user.liked_masterpieces
  end
end
