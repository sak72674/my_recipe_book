class Recipe < ApplicationRecord

	has_many :images, dependent: :destroy
	accepts_attachments_for :images, attachment: :image
	accepts_nested_attributes_for :images, allow_destroy: true

	has_many :ingredients, dependent: :destroy
	accepts_nested_attributes_for :ingredients, allow_destroy: :true

	has_many :steps, dependent: :destroy
	accepts_nested_attributes_for :steps, allow_destroy: :true

	validates_associated :ingredients
	validates_associated :steps

	validates :name, presence: true
	validates :introduction, presence: true
	validates :comment, presence: true
	validates :how_many, presence: true
	validates :is_private, inclusion: {in: [true, false]}

end
