class Step < ApplicationRecord

	belongs_to :recipe

	has_many :step_images, dependent: :destroy
	accepts_attachments_for :step_images, attachment: :step_image
	accepts_nested_attributes_for :step_images, allow_destroy: true
end
