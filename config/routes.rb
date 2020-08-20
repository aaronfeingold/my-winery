Rails.application.routes.draw do
  
  resources :wines
  
  resources :users, only: [:new, :create, :destroy] do 
    resources :wines
  end 

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/filter' => 'wines#filter'
  
  match '/auth/github/callback', to: 'sessions#githubcreate', via: [:get, :post]

  match '*a' => 'concerts#index', via: [:get]

end
