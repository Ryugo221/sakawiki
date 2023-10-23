Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :teams do
    resources :likes, only: [:create, :destroy]
    resources :players, only: [:create]
  end

  root 'teams#index'

  resources :players

  resources :sports
  
end
