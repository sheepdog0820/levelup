Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :edit, :update,:destroy]
  resources :groups, only: [:new, :create, :edit, :update]
  resources :tweets, only: [:index, :create,:destroy]
end
