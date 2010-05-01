require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'htmlentities'

module RecipeScraper
  def recipe_of_link
  end
  
  def load_recipe url
    recipe = open(url) { |f| Hpricot(f) }
    @recipe = Recipe.new
    @recipe.title = get_title recipe
    @recipe.ingredients = get_ingredients recipe
    @recipe.directions = get_directions recipe
    @recipe.yield = get_yield recipe
    if @recipe.title == '' || @recipe.ingredients == '' || @recipe.directions == ''
      nil
    else
      @recipe
    end
  end
  
  def get_title recipe
    title = ''
    (recipe/"div#headline").each do |dh|
      title = get_sanitized_innerHTML(dh.at("h1"))
    end
    title
  end
  
  def get_ingredients recipe
    ingredients = ''
    (recipe/"ul.ingredientsList").each do |il|
      (il/"li").each do |i|
        ingredients << get_sanitized_innerHTML(i) + "\n"
      end
    end 
    ingredients
  end
  
  def get_directions recipe
    directions = ''
    (recipe/"div#preparation").each do |dp|
      (dp/"p").each do |p|
        directions << get_sanitized_innerHTML(p) + "\n\n"
      end
    end
    directions
  end
  
  def get_yield recipe
    get_sanitized_innerHTML(recipe.at('span.yield'))
  end
  
  def get_sanitized_innerHTML e
    decoder = HTMLEntities.new
    decoder.decode(e.innerHTML.to_s.strip.gsub(/<\/?[^>]*>/, ""))
  end  
  
end