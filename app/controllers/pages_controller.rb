class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @lists = List.all
    @top_recipes = Recipe.get_top_recipes
    @recipes = Recipe.all
  end
end
