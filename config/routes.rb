Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items, except: :show do
  end
  
  resources :items do
    resources :images

    collection do
      get 'index_more_new_page'
    end
  end
   
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
