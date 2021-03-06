class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
