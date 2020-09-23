class StepImage < ApplicationRecord

	belongs_to :step
	attachment :step_image
	
end
