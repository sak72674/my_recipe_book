class ChangeDateStepImageIdToStepImages < ActiveRecord::Migration[5.2]
  def change
  	change_column :step_images, :step_image_id, :string
  end
end
