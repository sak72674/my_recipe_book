class Ingredient < ApplicationRecord

	belongs_to :recipe

	validates :ingredient, presence: true
	validates :quantity, presence: true
end
