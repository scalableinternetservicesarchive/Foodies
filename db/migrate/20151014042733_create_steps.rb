class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :recipe, index: false, foreign_key: true, null: false
      t.integer :step_number, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
