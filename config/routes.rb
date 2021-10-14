Rails.application.routes.draw do
  resources :home
  resources :external_transactions
  resources :group_transactions do
    match '/new', to: 'group_transactions#create', via: :post, on: :collection
  end
  resources :user_transactions do
    put :update_payments, on: :member
  end
  resources :groups
  devise_for :users

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
