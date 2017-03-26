Rails.application.routes.draw do
  # common urls - users, sessions and root path
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'site#index'

  # report for admin and agents
  get  'site/report'

  # customer actions
  resources :customers, except: [:destroy]

  # agent actions
  resources :agents, except: [:new, :create, :destroy]

  # admin actions
  resources :products
  resources :support_requests, except: [:new, :create]
  resource  :users
end
