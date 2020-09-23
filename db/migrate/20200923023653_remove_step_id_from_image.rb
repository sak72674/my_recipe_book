class RemoveStepIdFromImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :step_id, :integer
  end
end
