class Recipe
  attr_reader :label, :image, :uri, :ingredientLines, :totalNutrients, :url, :calories, :healthLabels, :source

  # def initialize(label, options = {} )
  def initialize( recipe_hash)
    @label = recipe_hash[:label]
    @image = recipe_hash[:image]
    @uri = recipe_hash[:uri]
    @ingredient_lines = recipe_hash[:ingredientLines]
    @total_nutrients = recipe_hash[:totalNutrients]
    @original_recipe = recipe_hash[:url]
    @calories = calories
    @healthLabels = healthLabels
    @source = source
  end

  def self.search(search, from, to)
    RecipeApiWrapper.listrecipes(search, from, to)
  end
end
