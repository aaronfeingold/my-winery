Rails.application.routes.draw do
  

  resources :wines
  resources :varietals
  
  resources :users, only: [:new, :create, :destroy] do 
    resources :wines
  end 
  
  resources :users, only: [:new, :create, :destroy] do 
    resources :varietals
  end 

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy' 
  
  # omniauth only with github. no facbook, so no need for :provider
  match '/auth/github/callback', to: 'sessions#githubcreate', via: [:get, :post]


end
