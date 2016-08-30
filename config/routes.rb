Rails.application.routes.draw do
  devise_for :users

  resources :customers
  resources :logs, except: [:edit, :update, :destroy]
  resource :dashboard, only: :index

  root 'dashboard#index'
end
