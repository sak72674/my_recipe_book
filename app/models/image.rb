class Image < ApplicationRecord

	belongs_to :recipe
	attachment :image

end
