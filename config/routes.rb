Rails.application.routes.draw do
  devise_for :users

  resources :groups do
    resources :entities
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "splash_screen#index"

  ###########################

  unauthenticated do
    root "splash_screen#index"
  end

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  ###########################
end


