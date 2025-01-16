class RecipesController < ApplicationController
  before_action :set_recipe, only: :show

  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
  end

  def show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'recipe saved.'
    else
      render :index, status: :unprocessable_entity, alert: 'Save failed'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cook_time, :difficulty, :oven_temp, :oven, :total_time, :ingredients, :instructions)
  end
end
