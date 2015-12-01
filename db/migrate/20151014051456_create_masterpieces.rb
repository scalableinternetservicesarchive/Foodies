class CreateMasterpieces < ActiveRecord::Migration
  def change
    create_table :masterpieces do |t|
      t.references :recipe, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.text :description
      t.integer :user_like_count, index: true, default: 0, null: false
      t.timestamps null: false
    end
  end
end
