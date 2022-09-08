require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin_role? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :diets, :eaten_products

  resources :eaten_products do
    get 'send_report', on: :member
  end

  namespace :admin do
    resources :users
  end

  root 'pages#index'
end
