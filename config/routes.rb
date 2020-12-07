Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items do
    resources :purchases
    resources :comments
  end
end