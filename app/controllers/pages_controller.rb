class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @lists = List.all
    @top_recipes = Recipe.top_recipes
    @recipes = Recipe.all
    @list = List.new
  end
end
