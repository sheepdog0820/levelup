Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root "tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
