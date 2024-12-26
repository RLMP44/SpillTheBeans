class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]
  before_action :set_all_lists, only: %i[index create]
  before_action :user_lists, only: %i[index create]
  before_action :authenticate_user!

  def index
    @list = List.new
  end

  def show
    @bookmarks = @list.bookmarks.all
    @bookmark = Bookmark.new
    @recipes = Recipe.pluck(:id, :name)
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list), notice: 'List saved.'
    else
      render :index, status: :unprocessable_entity, alert: 'Save failed'
    end
  end

  def destroy
    if @list.destroy
      redirect_to lists_path, notice: 'List deleted.'
    else
      render :show, status: :unprocessable_entity, alert: 'Delete failed'
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def set_all_lists
    @lists = List.all
  end

  def user_lists
    @user_lists = current_user.lists
  end

  def list_params
    params.require(:list).permit(:title, :comment)
  end
end
