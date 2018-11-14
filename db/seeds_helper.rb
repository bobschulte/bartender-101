$api_url = "https://www.thecocktaildb.com/api/json/v1/1"

$headers = {
  "cache-control" => 'no-cache'
}

def string_to_param(str)
  str.split(" ").join("%20")
end

def format_url(url)
  url.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
end

def api_request(url, headers)
  response = JSON.parse(RestClient.get(url, headers))
  response["drinks"]
end

def api_get_categories
  url = format_url($api_url + "/list.php?c=list")
  categories_array = api_request(url, $headers)
  categories_array = categories_array.map { |category| category["strCategory"] }
end

def api_get_drinks_from_category(category)
  url = format_url($api_url + "/filter.php?c=#{string_to_param(category)}")
  drinks_array = api_request(url, $headers)
  drinks_array = drinks_array.map { |drink| drink["strDrink"] }
end

def api_drink_search(drink)
  url = format_url($api_url + "/search.php?s=#{string_to_param(drink)}")
  api_request(url, $headers)
end

def seed_drink(drinks_array)
  drinks_array.each do |drink|
    cocktail = Cocktail.create(name: drink["strDrink"], instructions: drink["strInstructions"], glass_type: drink["strGlass"], img_url: drink["strDrinkThumb"])

    for i in (1..15)
      if !drink["strIngredient#{i}"].nil? && !drink["strIngredient#{i}"].empty?
        ingredient = Ingredient.find_or_create_by(name: drink["strIngredient#{i}"])

        if !cocktail.ingredients.include?(ingredient)
          cocktail.ingredients << ingredient
          cocktailingredient = CocktailIngredient.last.update(measurement: drink["strMeasure#{i}"])
        end
      end
    end
  end
end
