Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  root to: "pools#index"
  resources :pools do
    resources :orders, except: [:destroy]
  end
  resources :orders, only: [:destroy]
  get "dashboard", to: "dashboard#show"
  # , only: [:home, :show, :new, :create] do
    # resources :pools, only: [:show, :new, :create, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
