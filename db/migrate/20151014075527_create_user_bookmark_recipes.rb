class CreateUserBookmarkRecipes < ActiveRecord::Migration
  def change
    create_table :user_bookmark_recipes do |t|
      t.references :user, index: false, foreign_key: true, null: false
      t.references :recipe, index: false, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
