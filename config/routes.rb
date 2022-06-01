Rails.application.routes.draw do
  devise_for :users

  resources :groups do
    resources :entities
  end

  unauthenticated do
    root "splash_screen#index"
  end

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
end
