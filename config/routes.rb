Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :events, only: [:new, :index, :show, :create]
  resources :users, only: [:new, :create, :show]
end
