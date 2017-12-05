Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  ActiveAdmin.routes(self)

  resources :orders

  root to: 'welcome#index'
end
