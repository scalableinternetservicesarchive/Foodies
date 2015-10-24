class AddImgToRecipe < ActiveRecord::Migration
  def change
    add_attachment :recipes, :recipe_img
  end
end
