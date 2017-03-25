Rails.application.routes.draw do
  # common urls - devise and root
  devise_for :users
  root 'site#index'

  # customer urls
  resources :customers, except: [:destroy]

  # admin urls
  resources :products
  resources :support_requests
end
