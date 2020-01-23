Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'session#create'
  resources :users, only: [:new, :create, :show]
end
