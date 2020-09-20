class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
    	t.integer :recipe_id, null: false
    	t.integer :step_id, null: false
    	t.integer :image_id

      t.timestamps
    end
  end
end
