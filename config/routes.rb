Rails.application.routes.draw do
  root 'items#index'
  resources :items 
  # resources :image
  
   
end
