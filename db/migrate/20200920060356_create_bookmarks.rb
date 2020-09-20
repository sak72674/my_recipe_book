class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
    	t.integer :genre_id, null: false
    	t.string :name, null: false
    	t.text :url, null: false
    	t.string :site, null: false

      t.timestamps
    end
  end
end
