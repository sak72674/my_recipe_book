class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
    	t.integer :user_id, null: false
    	t.integer :genre_id, null: false
    	t.string :name, null: false
    	t.string :introduction, null: false
    	t.text :comment, null: false
    	t.integer :how_many, null: false
    	t.boolean :is_private, default: false, null: false

      t.timestamps
    end
  end
end
