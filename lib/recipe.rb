class Recipe
  attr_reader :label, :image, :uri, :ingredientLines, :totalNutrients, :url

  # def initialize(label, options = {} )
  def initialize(recipe_hash)
    # Soure_key, URI, label
    @label = recipe_hash[:label]
    @image = recipe_hash[:image]
    @uri = recipe_hash[:uri]
    @ingredient_lines = recipe_hash[:ingredientLines]
    @total_nutrients = recipe_hash[:totalNutrients]
    @original_recipe = recipe_hash[:url]
  end

  # Return a memoized set of all channels
  def self.search(search)
    @search = search
    RecipeApiWrapper.listrecipes(@search)
  end

  def self.search_url(url)
    @uri = url
    RecipeApiWrapper.listrecipes(@uri)
  end
  # # Foreget all memoized values
  # def self.reset
  # end

  # Return either the first (probably only) channel matching
  # # the given search, or nil.
  # def self.search(name)
  #   matches = all.select do |c|
  #     c.label == name
  #   end
  #   return matches
  # end
  #
  # # Return either the first (probably only) channel matching
  # # the given ID, or nil.
  # def self.by_id(id)
  # end
end

#
# @label = label
# @image = options[:image]
# @uri = options[:uri]
# @ingredient_lines = options[:ingredientLines]
# @total_nutrients = options[:totalNutrients]
# @original_recipe = options[:url]
