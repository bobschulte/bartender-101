Rails.application.routes.draw do

  resources :users, except: :destroy
  resources :sessions
  # resources :cocktail_ingredients
  resources :ingredients
  resources :cocktails
  post '/cocktails/new', to: 'cocktails#new'
end
