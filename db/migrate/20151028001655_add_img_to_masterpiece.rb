class AddImgToMasterpiece < ActiveRecord::Migration
  def change
    add_attachment :masterpieces, :masterpiece_img
  end
end
