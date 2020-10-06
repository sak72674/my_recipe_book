class CreateStepImages < ActiveRecord::Migration[5.2]
  def change
    create_table :step_images do |t|
    	t.integer :step_id, null: false
    	t.integer :step_image_id
    	
      t.timestamps
    end
  end
end
