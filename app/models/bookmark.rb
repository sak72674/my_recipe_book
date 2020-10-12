class Bookmark < ApplicationRecord

	belongs_to :genre
	belongs_to :user

	validates :name, presence: true
	validates :url, presence: true
	validates :site, presence: true
end
