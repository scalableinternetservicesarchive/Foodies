class AddImageToStep < ActiveRecord::Migration
  def change
    add_attachment :steps, :step_img
  end
end
