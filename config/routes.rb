Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # new & create for users
  resources :users, only: [:index, :new, :create]

  namespace :api do
    resources :events
    resources :favorites, only: [:index,:create,:destroy]
    resources :friendships

  end

  get '/users/log_in' => "users#log_in", as: :log_in
  get '/users/find' => "users#find_friends", as: :find_friends
  get '/users/faves' => "users#find_faves", as: :find_faves

  get '/favorites' => "users#favorites", as: :view_faves
  get '/events' => "users#events", as: :events

  post   '/sessions' => "sessions#create", as: :creation_station
  delete '/sessions' => "sessions#destroy", as: :deletion_station
end
