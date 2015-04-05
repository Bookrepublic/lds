Rails.application.routes.draw do
  resources :posts
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]

  root to: 'pages#show', id: 'home'
end
