Rails.application.routes.draw do
  devise_for :users, :controllers => {
 :registrations => 'users/registrations'
}

devise_scope :user do
  get 'users/idetification', to: "users/registrations#new_identification"
  
end

  # root 'users#index'
  resources :users, only: [:index, :new, :create, :edit, :update, :show] do
    resources :identifications, only: [:index, :new, :create, :edit, :update]
    resources :deliver_addresses
  end
end
