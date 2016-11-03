require 'httparty'
class RecipeApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY =ENV["APP_KEY"]

  def self.listrecipes(search)
    #? means there is going to be parameters
    # url = BASE_URL + "search?app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    url = BASE_URL + "search?q=#{search}"+ "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data = HTTParty.get(url)

    my_recipes = []
    if data["hits"]
      data["hits"].map do |hit|
        recipe_hash = {
        label: hit["recipe"]["label"],
        image: hit["recipe"]["image"],
        uri: hit["recipe"]["uri"],
        ingredientLines: hit["recipe"]["ingredientLines"],
        totalNutrients: hit["recipe"]["totalNutrients"],
        url: hit["recipe"]["url"],}
        # wrapper = Recipe.new( label, recipe_hash)
        wrapper = Recipe.new(recipe_hash)
        my_recipes << wrapper
      end
    end
    return my_recipes
  end
end


  # def self.show_recipe
  #   RecipeApiWrapper.listrecipes()
  #
  #   response_data = HTTParty.get(url)
  #
  # end
