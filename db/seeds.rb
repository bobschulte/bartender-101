require_relative 'seeds_helper'

Cocktail.destroy_all
Ingredient.destroy_all
CocktailIngredient.destroy_all

drink_categories = api_get_categories

drink_categories.each do | category |
  drinks_in_category = api_get_drinks_from_category(category)

  drinks_in_category.each do | drink |
    drink_info = api_drink_search(drink)
    seed_drink(drink_info)
  end
end
