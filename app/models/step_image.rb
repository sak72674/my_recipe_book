class StepImage < ApplicationRecord

	belongs_to :step, optional: true
	attachment :step_image

end
