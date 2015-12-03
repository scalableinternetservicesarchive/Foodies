class SearchController < ApplicationController

def index
end

def find_by_recipe
  @keyword = params[:search]
  if @keyword == ''
    @recipes = Recipe.none
  else
    @recipes_array = Recipe.find_by_sql(["
    SELECT recipes_with_keyword.* ,
       COALESCE( like.cnt, 0 ) AS users_liking_it_count,
       COALESCE( bookmark.cnt, 0 ) AS users_bookmarking_it_count,
       COALESCE( cook.cnt, 0 ) AS cooks_count
    FROM (
      SELECT * FROM
      recipes
      WHERE title LIKE ? OR description LIKE ?
      ORDER BY created_at DESC
    ) AS recipes_with_keyword
    LEFT JOIN
      ( SELECT recipe_id, COUNT(*) AS cnt FROM
        user_like_recipes
        GROUP BY recipe_id ) AS like
    ON recipes_with_keyword.id = like.recipe_id
    LEFT JOIN
      ( SELECT recipe_id, COUNT(*) AS cnt FROM
        user_bookmark_recipes
        GROUP BY recipe_id ) AS bookmark
    ON recipes_with_keyword.id = bookmark.recipe_id
    LEFT JOIN
      ( SELECT recipe_id, COUNT(*) AS cnt FROM
        masterpieces
        GROUP BY recipe_id ) AS cook
    ON recipes_with_keyword.id = cook.recipe_id
    ", "%"+@keyword+"%", "%"+@keyword+"%"])

    @recipes = Kaminari.paginate_array(@recipes_array).page(params[:page]).per(20)

    ActiveRecord::Associations::Preloader.new.preload(@recipes, :tags)
    ActiveRecord::Associations::Preloader.new.preload(@recipes, :creator)
  end
end

def find_by_tag
  @keyword = params[:search]
  if @keyword == ''
    @recipes = Recipe.none
  else
    @tag_id = ActsAsTaggableOn::Tag.find_by_sql(["
    SELECT tags.id FROM tags WHERE (LOWER(name) = LOWER(?))
    ", @keyword])

    # @tag.blank?
    @recipes_array = Recipe.find_by_sql(["
    SELECT recipes_with_tag.* ,
       COALESCE( like.cnt, 0 ) AS users_liking_it_count,
       COALESCE( bookmark.cnt, 0 ) AS users_bookmarking_it_count,
       COALESCE( cook.cnt, 0 ) AS cooks_count
    FROM (
      SELECT * FROM
      recipes
      JOIN taggings ON taggings.taggable_id = recipes.id
      AND taggings.taggable_type = 'Recipe'
      AND taggings.tag_id = ?
    ) AS recipes_with_tag
    LEFT JOIN
      ( SELECT recipe_id, COUNT(*) AS cnt FROM
        user_like_recipes
        GROUP BY recipe_id ) AS like
    ON recipes_with_tag.id = like.recipe_id
    LEFT JOIN
      ( SELECT recipe_id, COUNT(*) AS cnt FROM
        user_bookmark_recipes
        GROUP BY recipe_id ) AS bookmark
    ON recipes_with_tag.id = bookmark.recipe_id
    LEFT JOIN
      ( SELECT recipe_id, COUNT(*) AS cnt FROM
        masterpieces
        GROUP BY recipe_id ) AS cook
    ON recipes_with_tag.id = cook.recipe_id
    ", @tag_id])

    @recipes = Kaminari.paginate_array(@recipes_array).page(params[:page]).per(20)

    ActiveRecord::Associations::Preloader.new.preload(@recipes, :tags)
    ActiveRecord::Associations::Preloader.new.preload(@recipes, :creator)
  end
end

def find_by_user
  @keyword = params[:search]
  if @keyword == ''
    @users = User.none
  else
    @users = User.search(params[:search]).order("email ASC").page(params[:page]).per(20)
  end
end


end
