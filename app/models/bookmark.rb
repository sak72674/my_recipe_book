class Bookmark < ApplicationRecord

	belongs_to :genre

	validates :name, presence: true
	validates :url, presence: true
	validates :site, presence: true
end
