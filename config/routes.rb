Rails.application.routes.draw do
  devise_for :users
  resources :authors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books
end
