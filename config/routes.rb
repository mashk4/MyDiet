Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :diets
  resources :eaten_products

  namespace :admin do
    resources :users
  end

  root 'pages#index'
end
