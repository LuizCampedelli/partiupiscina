Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pools

  # , only: [:home, :show, :new, :create] do
    # resources :pools, only: [:show, :new, :create, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # end
end
