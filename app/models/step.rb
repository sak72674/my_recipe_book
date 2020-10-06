class Step < ApplicationRecord

	belongs_to :recipe, inverse_of: :steps

	has_many :step_images, dependent: :destroy, inverse_of: :step
	accepts_attachments_for :step_images, attachment: :step_image
	accepts_nested_attributes_for :step_images, allow_destroy: true

	validates :text, presence: true

end
