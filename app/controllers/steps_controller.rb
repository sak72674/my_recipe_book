class StepsController < ApplicationController
	def create
		@step.images.build
	end
end
