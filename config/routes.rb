Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
}

  devise_scope :user do
    get 'identifications', to: 'users/registrations#new_identification'
    post 'identifications', to: 'users/registrations#create_identification'
    get 'deliver_addresses', to: 'users/registrations#new_deliver_address'
    post 'deliver_addresses', to: 'users/registrations#create_deliver_address'
  end


  root 'items#index'
  resources :users
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
