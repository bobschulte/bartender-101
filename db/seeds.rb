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
  cocktail = Cocktail.create(name: drink["strDrink"], instructions: drink["strInstructions"], glass_type: drink["strGlass"], img_url: drink["strDrinkThumb"])
  # ingredients_array = []

  for i in (1..15)
    if !drink["strIngredient#{i}"].empty?
    ingredient = Ingredient.find_or_create_by(name: drink["strIngredient#{i}"])

      cocktail.ingredients << ingredient
      cocktailingredient = CocktailIngredient.last.update(measurement: drink["strMeasure#{i}"])
    end
  end

end
