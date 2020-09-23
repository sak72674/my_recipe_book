class RemoveStepImageIdFromImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :step_image_id, :integer
  end
end
