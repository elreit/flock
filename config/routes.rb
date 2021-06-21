Rails.application.routes.draw do
  devise_for :users
  root to: 'destinations#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    get "favorites"
  end
  resources :destinations, only: [:index, :new, :create, :update] do
    member do
      patch "arrived"
    end
  end
  get "coords", to: 'destinations#get_user_coords', as: :coords
  resources :walks, only: [:create, :show, :update, :destroy] do
    resources :reviews, only: [:new,:create]
    member do
      get "routes"
    end
  end
  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end
  get 'dashboard', to: 'users#dashboard'
end
