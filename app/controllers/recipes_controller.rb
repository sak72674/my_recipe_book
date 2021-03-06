class RecipesController < ApplicationController
	before_action :authenticate_user!

	def index
		if params[:genre_id]
      @recipes = current_user.recipes.where(genre_id: params[:genre_id]).order(:name).page(params[:page]).per(6)
      @bookmarks = current_user.bookmarks.where(genre_id: params[:genre_id]).order(:name).page(params[:page]).per(6)
      @genre = Genre.find(params[:genre_id])
    else
    	@recipes = current_user.recipes.all.order(:name).page(params[:page]).per(6)
    	@bookmarks = current_user.bookmarks.all.order(:name).page(params[:page]).per(6)
    end
	end

	def new
		@recipe = Recipe.new
		@recipe.images.build
		@recipe.ingredients.build
		step = @recipe.steps.build
		step.step_images.build
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.user_id = current_user.id
		if @recipe.save
			tags = []
			@recipe.images.each do |image|
				if image.image_id.present?
					tags = Vision.get_image_data(image)
				end
			end
	    tags.each do |tag|
	      @recipe.tags.create(name: tag)
	    end
			redirect_to recipe_path(@recipe)
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
		if @recipe.update(recipe_params)
			@recipe.tags.destroy_all
			tags = []
			@recipe.images.each do |image|
				if image.image_id.present?
					tags = Vision.get_image_data(image)
				end
			end
	    tags.each do |tag|
	      @recipe.tags.create(name: tag)
	    end
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to users_path
	end

	private

	def recipe_params
		params.require(:recipe).permit(:user_id,
																	:genre_id,
																	:name,
																	:introduction,
																  :comment,
																  :how_many,
																  :is_private,
																  images_attributes: [:id, :image],
																  ingredients_attributes: [:id, :name, :quantity],
																  steps_attributes: [:id, :text, step_images_attributes: [:id, :step_image]]
		)
	end
end
