Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index]
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes, only: %i[index show destroy]
  root 'home#index', as: :authenticated_root
end
