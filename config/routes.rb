Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :users, only: [:edit, :updata]
  resources :identifications, only: [:new, :create, :edit, :updata]
  resources :deliver_addresses
end
