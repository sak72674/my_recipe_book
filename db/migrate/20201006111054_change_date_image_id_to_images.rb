class ChangeDateImageIdToImages < ActiveRecord::Migration[5.2]
  def change
  	change_column :images, :image_id, :string
  end
end
