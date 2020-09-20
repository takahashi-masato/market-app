Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :cards , only: [:index,:new,:create,:destroy] do 
    collection do
      post 'cards', to:'cards#add_card'
    end
    member do
      patch 'cards', to:'cards#change_default_card'
    end
  end
  resources :users 

  resources :items do
    resources :images
    member do
      get 'buy_check_page'
      post 'pay', to:'items#pay', as: 'pay'
    end
    collection do
      get 'index_more_new_page'
      get 'done_page'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
   
end
