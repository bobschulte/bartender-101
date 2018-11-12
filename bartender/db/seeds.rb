Cocktail.destroy_all
Ingredient.destroy_all
CocktailIngredient.destroy_all

api_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
headers = {
  "cache-control" => 'no-cache'
}

response = JSON.parse(RestClient.get(api_url, headers))

drinks_array = response["drinks"]

drinks_array.each do |drink|
  byebug
  cocktail = Cocktail.new(name: drink["strDrink"])







end
