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

		recipe = Recipe.new(user_id: user_id, genre_id: genre_id, name: name, introduction: introduction, comment: comment, how_many: how_many, is_private: is_private)
		# recipe.images.new(image: image)
		unless ingredient.nil?
      ingredient.each do |k, v|
        recipe.ingredients.new(ingredient: v, quantity: quantity[k])
      end
    end

		unless step.nil?
			step.each do |k, v|
				recipe.steps.new(step: v)
			end
		end
		# recipe.step_images.new(step_image: step_image)
		recipe.save
	end

	def update
		return false if invalid?

		recipe = Recipe.new(user_id: user_id, genre_id: genre_id, name: name, introduction: introduction, comment: comment, how_many: how_many, is_private: is_private)
		# recipe.images.new(image: image)
		unless ingredient.nil?
      ingredient.each do |k, v|
        recipe.ingredients.new(ingredient: v, quantity: quantity[k])
      end
    end

		unless step.nil?
			step.each do |k, v|
				recipe.steps.new(step: v)
			end
		end
		# recipe.step_images.new(step_image: step_image)
		recipe.update
	end
end
