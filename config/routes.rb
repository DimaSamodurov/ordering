Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  resource :cart, only: [:show]

  resources :orders do
    member do
      put 'submit'
    end
  end
  resources :order_items, only: [:create, :update, :destroy], defaults: { format: 'js' }
  resources :products, only: [:index]

  root to: 'welcome#index'
end
