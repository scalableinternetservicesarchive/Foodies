module RecipesHelper
  include ActsAsTaggableOn::TagsHelper
  def cache_key_for_masterpiece_snippet(masterpiece)
    "masterpiece-#{masterpiece.id}-#{masterpiece.updated_at.try(:utc).try(:to_s, :number)}"
  end

  # def cache_key_for_recipe_show_part1(recipe)
  #   "recipe-show-part1-#{recipe.id}-#{recipe.updated_at.try(:utc).try(:to_s, :number)}"
  # end
  #
  # def cache_key_for_recipe_show_part2(recipe)
  #   "recipe-show-part2-#{recipe.id}-#{recipe.updated_at.try(:utc).try(:to_s, :number)}"
  # end
end
