module HomepageHelper
  def cache_key_for_recipe_snippet(recipe)
    "homepage-recipe-#{recipe.id}-#{recipe.updated_at}"
  end
end
