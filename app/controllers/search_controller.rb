class SearchController < ApplicationController

def index
end

def find_by_recipe
  @keyword = params[:search]
  @recipes = Recipe.search(params[:search]).order("created_at DESC")
end

def find_by_user
  @keyword = params[:search]
  @users = User.search(params[:search]).order("email ASC")
end

end
