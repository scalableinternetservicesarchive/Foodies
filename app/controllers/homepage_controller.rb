class HomepageController < ApplicationController
  @@view_count = 0

  def show
    @top_bookmarked_recipes = Recipe.order(user_bookmark_count: :desc).limit(100)
    @top_recommended_recipes = Recipe.order(user_bookmark_count: :desc).limit(5)
    @tags = ActsAsTaggableOn::Tag.most_used(10)
    @@view_count += 1
    @view_count = @@view_count
    @user_count = Rails.cache.fetch("user_count", expires_in: 1.minutes) do
      User.all.count
    end
    @recipe_count = Rails.cache.fetch("recipe_count", expires_in: 1.minutes) do
      Recipe.all.count
    end
    @masterpiece_count = Rails.cache.fetch("masterpiece_count", expires_in: 1.minutes) do
      Masterpiece.all.count
    end
  end

  def self.view_count
    @@view_count
  end
end
