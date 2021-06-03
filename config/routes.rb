Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :destinations, only: [:index, :new, :create, :update]
  resources :walks, only: [:create, :show, :update]
  get 'dashboard', to: 'users#dashboard'
end
