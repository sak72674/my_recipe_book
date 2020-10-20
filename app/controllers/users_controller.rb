class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@search = Recipe.ransack(params[:q])
		@genres = Genre.all
		@recipes = @search.result(distinct: true).where(is_private: false).order(created_at: :desc)
		@favorite_recipes = current_user.favorite_recipes.order(created_at: :desc)
	end

	def favorite
		@favorite_recipes = current_user.favorite_recipes.order(created_at: :desc)
	end

<<<<<<< HEAD
=======
	private

	def user_params
		params.require(:user).permit(:name, :email)
	end

>>>>>>> d24b27f59459ed766c42617af8c3ec61a5b447de
end
