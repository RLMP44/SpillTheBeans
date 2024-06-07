class ListsController < ApplicationController
  before_action :set_list

  def index
    # @lists = List.all
    # Preloads title to help wiht N+1 queries
    @lists = List.includes(:title)
  end

  def show
    @bookmarks = @list.bookmarks.all
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end
