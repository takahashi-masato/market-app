Rails.application.routes.draw do

  root 'items#index'

  devise_for :users
  resources :identifications
  resources :users
  resources :deliver_addresses
end
