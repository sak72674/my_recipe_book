class AddStepImageIdToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :step_image_id, :integer
  end
end
