class Recipe < ApplicationRecord

	has_many :images, dependent: :destroy
	accepts_attachments_for :images, attachment: :image

	has_many :ingredients, dependent: :destroy

	has_many :steps, dependent: :destroy

end
