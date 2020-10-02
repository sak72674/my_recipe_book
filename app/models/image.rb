class Image < ApplicationRecord

	belongs_to :recipe, optional: true
	attachment :image

end
