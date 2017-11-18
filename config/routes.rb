Rails.application.routes.draw do

  resources :orders
  devise_for :users
  root to: 'welcome#index'

end
