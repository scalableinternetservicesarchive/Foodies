class CreateUserBookmarkRecipes < ActiveRecord::Migration
  def change
    create_table :user_bookmark_recipes do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :recipe, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
