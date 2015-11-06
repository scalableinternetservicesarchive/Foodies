class SearchController < ApplicationController

def index
end

def find_by_recipe
  @recipes = Recipe.search(params[:search]).order("created_at DESC")
end

def find_by_masterpiece
  @masterpieces = Masterpiece.search(params[:search]).order("created_at DESC")
end

def find_by_user
  @users = User.search(params[:search]).order("email ASC")
end

def find_by_ingredient
  @ingredients = Ingredient.search(params[:search]).order("name ASC")
end

end
