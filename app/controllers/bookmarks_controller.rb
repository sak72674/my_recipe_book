class BookmarksController < ApplicationController

	def new
		@bookmark = Bookmark.new
	end

	def create
		@bookmark = Bookmark.new(bookmark_params)
		if @bookmark.save
			redirect_to bookmark_path(@bookmark.id)
		else
			render :new
		end
	end

	def show
		@bookmark = Bookmark.find(params[:id])
	end

	def edit
		@bookmark = Bookmark.find(params[:id])
	end

	def update
		@bookmark = Bookmark.find(params[:id])
		if @bookmark.update
			redirect_to bookmark_path(@bookmark.id)
		else
			render :edit
		end
	end

	def destroy
		@bookmark = Bookmark.find(params[:id])
		@bookmark.destroy
		redirect_to recipes_path
	end

	private

	def bookmark_params
		params.require(:bookmark).permit(:genre_id, :name, :url, :site)
	end

end
