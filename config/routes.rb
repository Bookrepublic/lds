Rails.application.routes.draw do
  resources :posts
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resources :tags, only: [:show, :index]
  resources :videos, only: [:show, :index]
  resources :images do
    collection do
      post :post_image, to: 'images#post_image_create'
    end
  end

  root to: 'pages#show', id: 'home'
end
