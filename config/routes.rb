Rails.application.routes.draw do
  resources :users do
    resources :groups
    resources :entities
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/splash_screen/index', to: 'splash_screen#index'
  
  # Defines the root path route ("/")
  root "splash_screen#index"
end
