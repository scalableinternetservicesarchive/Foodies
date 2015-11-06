class HomepageController < ApplicationController
  @@view_count = 0

  def show
    @top_saved_recipes = Recipe.order(user_save_count: :desc).limit(100)
    @top_recommended_recipes = Recipe.order(user_save_count: :desc).limit(5)
    @tags = ActsAsTaggableOn::Tag.most_used(10)
    @@view_count += 1
    @view_count = @@view_count
    @user_count = User.all.count
    @recipe_count = Recipe.all.count
    @masterpiece_count = Masterpiece.all.count
  end

  def self.view_count
    @@view_count
  end
end
