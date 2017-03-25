Rails.application.routes.draw do
  # common urls - users, sessions and root path
  devise_for :users
  root 'site#index'

  # customer actions
  resources :customers, except: [:destroy]

  # agent actions
  resources :agents, except: [:new, :create, :destroy]

  # admin actions
  resources :products
  resources :support_requests
end
