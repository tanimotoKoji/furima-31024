Rails.application.routes.draw do

  devise_for :users

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
  
  root to: "items#index"
  get 'items', to: 'items#index'
  post 'items', to: 'items#create'
  
  resources :items, only: [:new, :show, :create,]
  resources :purchases, only: [:show]


end
