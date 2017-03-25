Rails.application.routes.draw do
  devise_for :users
  root 'site#index'
  resources :products
  resources :support_requests
end
