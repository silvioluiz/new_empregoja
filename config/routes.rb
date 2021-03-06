Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :jobs , only: [:new, :create, :edit, :update, :show]
  resources :companies, only: [:new, :create, :show]
  resources :categories, only: [:new, :create, :show]
end
