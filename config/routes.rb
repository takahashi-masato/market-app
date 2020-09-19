Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'items#index'
  resources :users, only: [:show]
>>>>>>> 9c8cdda... TESTコミット
  resources :items, except: :show do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    resources :images

    collection do
      get 'index_more_new_page'
    end
  end
   
end
