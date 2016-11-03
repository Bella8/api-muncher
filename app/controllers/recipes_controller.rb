class RecipesController < ApplicationController

  def search_home
    if params[:search] != nil
      @name = params[:search]
      redirect_to recipes_search_path(@name)
    end
  end

  def search
    @search = params[:search]
    @data = Recipe.search(@search)
  end

  def fetch
    search.map do |item|
      @uri = item["recipe"]["uri"]
    end
  end

  def show
    @item = Recipe.fetch(params[:uri])
    #  @item = fetch
  end
end
