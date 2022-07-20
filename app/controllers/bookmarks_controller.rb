class BookmarksController < ApplicationController
    def index
      @bookmarks = Bookmark.all
    end
    def show
      @bookmark = Bookmark.find(params[:id])
    end
    def new
      @bookmark = Bookmark.new
    end
    def create
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.list = @list
      if @bookmark.save
        redirect_to list_path(@list)
      else
        render :new
      end
    end

    def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
    end

    private

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end
end
