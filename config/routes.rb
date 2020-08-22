Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :images

    collection do
      get 'index_more_new_page'
    end
  end
   
end
