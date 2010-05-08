class Recipe < ActiveRecord::Base
  require 'json'
  
  has_many :meals
  belongs_to :user
  belongs_to :original_recipe, :class_name => 'Recipe'
  validates_presence_of :title, :directions, :ingredients 
  
  def to_json
    result = Hash.new
    self.class.content_columns.each do |column|
        result[column.name.to_sym] = self.send(column.name)
    end
    result.to_json
  end
  
  def self.recipes_made_by_user user
    user_recipes = get_user_recipes user
    user_recipes.select do |r|
      Meal.find(:all, 
        :conditions => ["user_id = :user_id and day < :day", 
          {:user_id => user, :day => Date.today}]).map{ |m| m.recipe }.include? r
    end
  end
  
  def self.recipes_planned_by_user user
    user_recipes = get_user_recipes user
    user_recipes.select do |r|
      Meal.find(:all, 
        :conditions => ["user_id = :user_id and day >= :day", 
          {:user_id => user, :day => Date.today}]).map{ |m| m.recipe }.include? r
    end
  end
  
  def self.recipes_unplanned_by_user user
    user_recipes = get_user_recipes user
    user_recipes.reject do |r|
      Meal.find_all_by_user_id(user).map{ |m| m.recipe }.include? r
    end
  end
  
  def self.other_recipes_by_user user
    user_recipes = get_user_recipes user
    recipes = Recipe.find(:all, 
      :conditions => [ "user_id != :user_id", {:user_id => user}], 
                                            :order => "upper(title) ASC")
    recipes.reject{ |r| 
                    user_recipes.map { |u| 
                      u.original_recipe_id}.include? r.original_recipe_id}
  end
  
  
  private 
  
  def self.get_user_recipes user
    Recipe.find_all_by_user_id(user, :order => "upper(title) ASC")
  end
  
end
