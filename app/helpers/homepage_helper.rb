module HomepageHelper
  def cache_key_for_recipe_snippet(recipe)
    "homepage-recipe-#{recipe.id}-#{recipe.updated_at}"
  end

  def cache_key_for_recipe_table
    max_updated_at = @top_bookmarked_recipes.max_by(&:updated_at).updated_at.try(:utc).try(:to_s, :number)
    "homepage-recipe-table-#{max_updated_at}"
  end
end
