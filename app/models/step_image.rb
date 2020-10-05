class StepImage < ApplicationRecord

	belongs_to :step, inverse_of: :step_images
	attachment :step_image

end
