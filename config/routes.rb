Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    # devise_for :users
    root 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :recipes, only: [:index, :show, :destroy] 
end
