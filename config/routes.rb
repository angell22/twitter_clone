Rails.application.routes.draw do
  root 'tweets#index'

  resources :users
  resources :sessions
  resources :tweets do 
    resources :replies
  end
  
  
  get 'login', to: 'sessions#new', as: 'user_login'
end
