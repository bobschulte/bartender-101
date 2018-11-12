require 'json'
require 'rest-client'
require 'pry'
require_relative '../config'

api_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
headers = {
  "cache-control" => 'no-cache'
}

response = JSON.parse(RestClient.get(api_url, headers))

drinks_array = response["drinks"]

drinks_array.each do |drink|
  binding.pry
  cocktail = Cocktail.new(name: drink["strDrink"])







end
