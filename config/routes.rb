Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [ :create,  :edit, :update, :show ] do
    get 'start', on: :member
    resources :participations, only: [ :new, :create]
    resources :answers, only: [ :create, :show ]
  end

end
