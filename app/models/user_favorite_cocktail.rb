class UserFavoriteCocktail < ApplicationRecord
    belongs_to :user
    belong_to :cocktail
end
