class RecipesController < ApplicationController

  def home
    if params[:search].present? && !params[:search].empty?
      @name = params[:search]
      redirect_to recipes_search_path(@name)
    end
  end

  def index
    #if params page is nill return one.
    @page = (params[:page] || 1).to_i
    @search = params[:search]
    from = (@page - 1) * 10
    to = from + 10
    @data = Recipe.search(@search, from, to)
    if @data.empty?
      flash.now[:notice] = "Sorry, no recipes to show."
    end
  end

  def show
    id = params[:id]
    @recipe = RecipeApiWrapper.get_recipe(id)
  end
end
