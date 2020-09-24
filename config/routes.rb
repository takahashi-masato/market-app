Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:show]
  resources :items, except: :show do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    resources :images

    collection do
      get 'index_more_new_page'
    end
  end
  resources :users do
    member do
      get 'index_seller_page'
      get 'index_buyer_page'
    end
  end
   
end
