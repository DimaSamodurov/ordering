Rails.application.routes.draw do

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy], defaults: { format: 'js' }

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  ActiveAdmin.routes(self)

  resources :orders do
    member do
      put 'submit'
    end
  end

  root to: 'welcome#index'
end
