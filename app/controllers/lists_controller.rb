class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]

  def index
    @lists = List.all
    @bookmark = Bookmark.new
  end

  def show
    @bookmarks = @list.bookmarks.all
  end

  def create
    list = List.new(list_params)
    list.user = current_user
    if list.save
      redirect_to list_path(list)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :comment)
  end
end
