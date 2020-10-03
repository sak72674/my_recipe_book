class RecipesController < ApplicationController

	def index
		@recieps = Recipe.all.order(:name)
		@bookmarks = Bookmark.all.order(:name)
	end

	def new
		@recipe_form =  RecipeForm.new
	end

	def create
		@recipe_form = RecipeForm.new(recipe_params)
		@recipe_form.user_id = current_user.id
		if @recipe_form.save
			redirect_to recipe_path(@recipe.id)
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
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe.id)
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
