class Image < ApplicationRecord

	belongs_to :recipe, inverse_of: :images
	attachment :image

end
