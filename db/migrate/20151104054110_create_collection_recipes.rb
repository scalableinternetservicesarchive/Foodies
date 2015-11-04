class CreateCollectionRecipes < ActiveRecord::Migration
  def change
    create_table :collection_recipes do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
