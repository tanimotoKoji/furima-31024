Rails.application.routes.draw do
<<<<<<< Updated upstream
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
  devise_for :users

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
  
  root to: "items#index"
  get 'items', to: 'items#index'
  post 'items', to:'items#create'

  resources :items
>>>>>>> Stashed changes
end
