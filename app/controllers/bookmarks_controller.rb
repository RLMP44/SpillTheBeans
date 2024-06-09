class BookmarksController < ApplicationController
  def create
    bookmark = Bookmark.new(bookmark_params)
    if bookmark.save
      redirect_to list_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
