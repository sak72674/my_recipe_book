class RenameStepColumnToSteps < ActiveRecord::Migration[5.2]
  def change
  	rename_column :steps, :step, :text
  end
end
