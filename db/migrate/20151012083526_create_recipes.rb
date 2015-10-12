class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :cook_time
      t.text :steps

      t.timestamps null: false
    end
  end
end
