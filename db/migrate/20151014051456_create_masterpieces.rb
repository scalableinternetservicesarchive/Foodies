class CreateMasterpieces < ActiveRecord::Migration
  def change
    create_table :masterpieces do |t|
      t.references :recipe, index: false, foreign_key: true, null: false
      t.references :user, index: false, foreign_key: true, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
