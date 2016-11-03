class RecipesController < ApplicationController

  def search_home
    if params[:search] != nil
      @name = params[:search]
      redirect_to recipes_search_path(@name)
    end
  end

  def index
    @search = params[:search]
    @data = Recipe.search(@search)
  end

  def show
    @params = params[:uri]
    @recipe = RecipeApiWrapper.get_recipe(@params)

  end
end
