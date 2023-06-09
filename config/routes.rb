Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index]
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index', as: :authenticated_root
  
  resources :users do
    resources :foods, only: %i[index new create]
    resources :general_shopping_list, only: [:index]
  end
  resources :recipes, only: %i[index new create show destroy] do
    resources :recipe_foods, only: %i[new create destroy edit update]
  end
  get '/public_recipes', to: 'recipes#public_recipe'
  get '/general_shopping_list', to: 'general_shopping_list#index', as: 'general_shopping_list'
 
end
