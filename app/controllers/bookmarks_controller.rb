class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: :create

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark saved.'
    else
      render 'lists/show', status: :unprocessable_entity, alert: 'Save failed'
    end
  end

  def destroy
    list = @bookmark.list
    if @bookmark.destroy
      redirect_to list_path(list), notice: 'Bookmark deleted.'
    else
      render 'lists/show', status: :unprocessable_entity,  alert: 'Delete failed'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :recipe_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
