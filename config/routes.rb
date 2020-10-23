Rails.application.routes.draw do

  devise_for :users

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
  
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create]
  end

end
