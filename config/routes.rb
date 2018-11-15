Rails.application.routes.draw do

  get '/', to: 'sessions#new', as: 'root'

  resources :users, except: [:index, :destroy]

  resources :sessions, only: [:new, :create]
  get '/login', to: 'sessions#new'
  post '/logout', to: 'sessions#destroy'

  resources :ingredients, except: [:destroy]
  post '/ingredients/new', to: 'ingredients#new'

  resources :cocktails
  post '/cocktails/new', to: 'cocktails#new'
  post '/cocktails/:id', to: 'cocktails#favorite', as: 'add_favorite'
end
