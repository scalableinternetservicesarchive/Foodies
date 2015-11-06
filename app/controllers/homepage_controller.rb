class HomepageController < ApplicationController
  def show
    @top_saved_recipes = Recipe.order(user_save_count: :desc).limit(100)
    @top_recommended_recipes = Recipe.order(user_save_count: :desc).limit(5)
    @tags = ActsAsTaggableOn::Tag.most_used(10)
  end
end
