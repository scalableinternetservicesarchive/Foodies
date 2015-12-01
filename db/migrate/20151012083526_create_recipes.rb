class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :title, null: false
      t.text :description
      t.integer :cook_time
      t.integer :user_bookmark_count, index: true, default: 0, null: false
      t.integer :user_like_count, index: true, default: 0, null: false
      t.timestamps null: false
    end
  end
end
