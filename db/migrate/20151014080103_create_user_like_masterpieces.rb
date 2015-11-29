class CreateUserLikeMasterpieces < ActiveRecord::Migration
  def change
    create_table :user_like_masterpieces do |t|
      t.references :user, index: false, foreign_key: true, null: false
      t.references :masterpiece, index: false, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
