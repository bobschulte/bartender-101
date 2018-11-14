Rails.application.routes.draw do

  get '/', to: 'sessions#new', as: 'root'

  resources :users, except: :destroy

  resources :sessions, except: :destroy
  get '/login', to: 'sessions#new'
  post '/logout', to: 'sessions#destroy'

  resources :ingredients

  resources :cocktails
  post '/cocktails/new', to: 'cocktails#new'
end
