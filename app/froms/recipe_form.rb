class RecipeForm
	include ActiveModel::Model
	attr_accessor :user_id,
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

	validates :name, presence: true
	validates :genre_id, presence: true
	validates :introduction, presence: true
	validates :ingredient, presence: true
	validates :quantity, presence: true
	validates :step, presence: true
	validates :comment, presence: true

	def save
		return false if invalid?

		recipe = recipe.new(user_id: user_id, genre_id: genre_id, name: name, introduction: introduction, comment: comment, how_many: how_many, is_private: is_private)
		recipe.images.new(image_id: image_id)
		recipe.ingredients.new(ingredient: ingredient, quantity: quantity)
		recipe.steps.new(step: step)
		recipe.step_images.new(step_image_id: step_image_id)
		recipe.save
	end
end
