class Recipe < ApplicationRecord

	has_many :images, dependent: :destroy, inverse_of: :recipe
	accepts_attachments_for :images, attachment: :image
	accepts_nested_attributes_for :images, allow_destroy: true

	has_many :ingredients, dependent: :destroy, inverse_of: :recipe
	accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

	has_many :steps, dependent: :destroy, inverse_of: :recipe
	accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank

	validates :name, presence: true
	validates :genre_id, presence: true
	validates :introduction, presence: true
	validates :comment, presence: true

	belongs_to :genre
	belongs_to :user

end
