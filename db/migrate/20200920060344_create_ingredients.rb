class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
    	t.integer :recipe_id, null: false
    	t.string :ingredient, null: false
    	t.string :quantity, null: false

      t.timestamps
    end
  end
end
