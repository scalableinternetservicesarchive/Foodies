class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :recipe, index: true, foreign_key: true, null: false
      t.string :name, index: true, null: false
      t.string :quantity

      t.timestamps null: false
    end
  end
end
