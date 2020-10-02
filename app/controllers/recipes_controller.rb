class RecipesController < ApplicationController

	def index
		@recieps = Recipe.all
	end

	def new
		@recipe_form =  RecipeForm.new
	end

	def create
		@recipe_form = RecipeForm.new(recipe_params)
		@recipe_form.user_id = current_user.id
		binding.pry
		if @recipe_form.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
		@recipe.update(recipe_params)
		redirect_to recipe_path(@recipe.id)
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to root_path
	end

	private

	def recipe_params
		params.require(:recipe_form).permit(
			:user_id,
																				:genre_id,
																				:name,
																			  :introduction,
																			  :comment,
																			  :how_many,
																			  :is_private,
																			  :image,
																			  :ingredient,
																			  :quantity,
																			  :step,
																			  :step_image
		)
			# :user_id,
			# :genre_id,
			# :name,
			# :introduction,
			# :comment,
			# :how_many,
			# :is_private,
			# image_attributes: [:id,
			# 									 :recipe_id,
			# 									 :image_id],
			# ingredient_attributes: [:id,
			# 											  :recipe_id,
			# 											  :ingredient,
			# 											  :quantity],
			# step_attributes: [:id,
			# 								  :recipe_id,
			# 								  :steps,
			# 								  step_image_attributes: [:id,
			# 								                    		  :step_id,
			# 								                     			:step_image_id]]
			# )
	end

end
