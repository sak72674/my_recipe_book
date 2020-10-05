class Ingredient < ApplicationRecord

	belongs_to :recipe, inverse_of: :ingredients

	validates :name, presence: true
	validates :quantity, presence: true

end
