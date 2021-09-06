Rails.application.routes.draw do
  root 'teams#index'
  resources :teams
  devise_for :trainers
  resources :profile, only: [:show]
end
