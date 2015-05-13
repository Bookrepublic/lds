Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show', as: :user
  get 'users/' => 'users#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :sponsors, only: [:index,:show]
  resources :posts
  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resources :tags, only: [:show, :index]
  resources :videos, only: [:show, :index]
  resources :collections, only: [:show, :index]
  resources :images do
    collection do
      post :post_image, to: 'images#post_image_create'
    end
  end

  root to: 'pages#show', id: 'home'
  get '/*id' => 'pages#show', as: :page, format: false
end
