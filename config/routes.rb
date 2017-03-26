Rails.application.routes.draw do
  # common urls - root path, devise actions, common models list
  devise_for :users, :controllers => { registrations: 'registrations' }
  root  'site#index'
  resources :request_states, only: [:index]

  # report for admin and agents
  get   'report', to: 'site#report'

  # customer actions
  resources :customers, except: [:destroy]

  # agent actions
  resources :agents, except: [:new, :create, :destroy]

  # admin actions
  resources :products
  resources :support_requests, except: [:new, :create]
  resources :users
end
