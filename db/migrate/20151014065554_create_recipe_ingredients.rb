class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, index: true, foreign_key: true, null: false
      t.references :ingredient, index: true, foreign_key: true, null: false
      t.string :amount

      t.timestamps null: false
    end
  end
end
