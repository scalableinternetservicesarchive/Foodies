class SearchController < ApplicationController

def index
end

def find_by_recipe
  @keyword = params[:search]
  if @keyword == ''
    @recipes = Recipe.none
  else
    @recipes = Recipe.select('id, title, description, recipe_img_file_name, user_id, created_at').search(params[:search]).order("created_at DESC")
  end
end

def find_by_tag
  @keyword = params[:search]
  if @keyword == ''
    @recipes = Recipe.none
  else
    @recipes = Recipe.select('recipes.id, title, description, recipe_img_file_name, user_id').tagged_with(params[:search])
  end
end

def find_by_user
  @keyword = params[:search]
  if @keyword == ''
    @users = User.none
  else
    @users = User.select('id, username, email, created_at, avatar_file_name').search(params[:search]).order("email ASC")
  end
end


end
