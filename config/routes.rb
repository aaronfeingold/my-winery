Rails.application.routes.draw do
  

  resources :wines
  resources :varietals
  
  resources :users do 
    resources :wines
  end 
  
  resources :users do 
    resources :varietals
  end 

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy' 

  # get '/filter' => 'wines#filter'
  
  match '/auth/github/callback', to: 'sessions#githubcreate', via: [:get, :post]

  # match '*a' => 'wines#index', via: [:get]

end
