Rails.application.routes.draw do
  # resources :cocktail_ingredients
  resources :ingredients
  resources :cocktails
  post '/cocktails/new', to: 'cocktails#new'
end
