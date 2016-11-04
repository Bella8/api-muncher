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
    if @page > 0
    from = (@page - 1) * 10
    to = from + 10
    @data = Recipe.search(@search, from, to)
  end
  end

  def show
    @params = params[:uri]
    @recipe = RecipeApiWrapper.get_recipe(@params)

  end
end
