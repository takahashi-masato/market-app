Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :cards , only: [:new,:create,:show,:delete]
  resources :users , only: [:show]
  resources :items do
    resources :images
    member do
      get 'buy_check_page'
    end
    collection do
      get 'index_more_new_page'
      get 'done_page'
      post 'pay/:id'=> 'items#pay', as: 'pay'
    end
  end
   
end
