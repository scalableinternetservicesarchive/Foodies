module SearchHelper
  def cache_key_for_search_recipe_snippet(recipe)
    "recipe-#{recipe.id}-#{recipe.updated_at}-#{recipe.users_liking_it.count}-#{recipe.users_bookmarking_it.count}-#{recipe.cooks.count}"
  end
  def cache_key_for_search_user_snippet(user)
    "user-#{user.id}-#{user.updated_at}-#{user.username}-#{user.email}"
  end
end
