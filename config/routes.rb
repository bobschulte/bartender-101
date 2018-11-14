Rails.application.routes.draw do
  resources :users
  resources :sessions
  # resources :cocktail_ingredients
  resources :ingredients
  resources :cocktails
  post '/cocktails/new', to: 'cocktails#new'
end
