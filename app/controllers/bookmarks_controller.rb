class BookmarksController < ApplicationController
    
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end
  
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    @bookmark.save

    redirect_to list_path(params[:list_id])
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    
    redirect_to lists_path
  end
  
  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
