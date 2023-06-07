Rails.application.routes.draw do
  devise_for :users
  root 'home#index', as: :authenticated_root

  resources :users do
    resources :foods, only: [:index, :new, :create] 
  end
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :shopping_lists, only: [:index] 
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  get '/public_recipes', to: 'recipes#public_recipe'
end