# frozen_string_literal: true

Rails.application.routes.draw do
  resources :wines
  resources :varietals

  resources :users, only: %i[new create destroy] do
    resources :wines
  end

  resources :users, only: %i[new create destroy] do
    resources :varietals
  end

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # omniauth only with github. no facbook, so no need for :provider
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
end
