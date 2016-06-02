Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # new & create for users
  resources :users, only: [:new, :create]

  namespace :api do
    resources :events
    resources :favorites

  end

  get '/users/log_in' => "users#log_in", as: :log_in

  get '/events' => "users#events", as: :events

  post   '/sessions' => "sessions#create", as: :creation_station
  delete '/sessions' => "sessions#destroy", as: :deletion_station
end
