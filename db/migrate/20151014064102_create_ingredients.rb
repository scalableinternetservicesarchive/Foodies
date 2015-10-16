class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
