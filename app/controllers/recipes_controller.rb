class RecipesController < ApplicationController

	def index
		if params[:genre_id]
      @recipes = current_user.recipes.where(genre_id: params[:genre_id]).order(:name).page(params[:page]).per(10)
      @genre = Genre.find(params[:genre_id])
    else
    	@recipes = current_user.recipes.all.order(:name).page(params[:page]).per(10)
    end
		# @bookmarks = current_user.bookmarks.all.order(:name)
	end

	def new
		@recipe_form = RecipeForm.new
	end

	def create
		@recipe_form = RecipeForm.new(recipe_params)
		@recipe_form.user_id = current_user.id
		if @recipe_form.save
			redirect_to recipes_path
		else
			render :new
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
		@ingredient = Ingredient.where(:recipe_id => @recipe.id)
		@step = Step.where(:recipe_id => @recipe.id)
	end

	def edit
  	recipe = Recipe.find(params[:id])
  	@recipe_form = RecipeForm.new(user_id: recipe.user_id, genre_id: recipe.genre_id, name: recipe.name, introduction: recipe.introduction, comment: recipe.comment, how_many: recipe.how_many, is_private: recipe.is_private)
	end

	def update
		recipe = Recipe.find(params[:id])
		@recipe_form = RecipeForm.new(user_id: recipe.user_id, genre_id: recipe.genre_id, name: recipe.name, introduction: recipe.introduction, comment: recipe.comment, how_many: recipe.how_many, is_private: recipe.is_private)
		if @recipe.update(recipe_params)
			redirect_to recipes_path
		else
			render :edit
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to recipes_path
	end

	private

	def recipe_params
		ingredient = params.permit(ingredient:{}, quantity:{})
		step = params.permit(step:{})
		recipe = params.require(:recipe_form).permit(:user_id,
																								 :genre_id,
																								 :name,
																							   :introduction,
																							   :comment,
																							   :how_many,
																							   :is_private,
																							   :image
		)
		hash1 = recipe.merge(ingredient)
		hash1.merge(step)
	end

end
