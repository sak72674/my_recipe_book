class Step < ApplicationRecord

	belongs_to :recipe, optional: true

	has_many :step_images, dependent: :destroy
	accepts_attachments_for :step_images, attachment: :step_image

end
