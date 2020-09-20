class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.integer :recipe_id, null: false
      t.text :step, null: false

      t.timestamps
    end
  end
end
