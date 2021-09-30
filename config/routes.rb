Rails.application.routes.draw do
  resources :group_transactions
  resources :user_transactions
  resources :groups
  devise_for :users

  root 'groups#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
