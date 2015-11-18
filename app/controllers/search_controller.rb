class SearchController < ApplicationController

def index
end

def find_by_recipe
  @keyword = params[:search]
  if @keyword == ''
    @recipes = Recipe.none
  else
    @recipes = Recipe.search(params[:search]).order("created_at DESC")
  end
end

def find_by_user
  @keyword = params[:search]
  if @keyword == ''
    @users = User.none
  else
    @users = User.search(params[:search]).order("email ASC")
  end
end

end
