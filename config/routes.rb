Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [ :create,  :edit, :update, :show ] do
    patch 'created', on: :member
    get 'ready', on: :member
    patch 'running', on: :member
    patch 'paused', on: :member
    resources :participations, only: [ :edit, :update ]
    resources :answers, only: [ :create, :show ]
  end
  get "users/:id", to: "users#show"
  resources :participations, only: [ :new, :create, :show ]
end
