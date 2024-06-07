class ListsController < ApplicationController
  before_action :set_list

  def index
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def set_list
    @lists = List.all
  end
end
