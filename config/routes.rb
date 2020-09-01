Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
}

devise_scope :user do
  get 'users/identification', to: "users/registrations#new_identification"
  get "sign_in", :to => "users/sessions#new"
  get "sign_out", :to => "users/sessions#destroy"
end
  root 'items#index'
end
