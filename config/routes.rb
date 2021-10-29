Rails.application.routes.draw do
  resources :home, only: %i[index]
  resources :external_transactions, only: %i[index]
  resources :group_transactions, only: %i[create new] do
    match '/new', to: 'group_transactions#create', via: :post, on: :collection
  end
  resources :user_transactions do
    put :update_payments, on: :member
    put :archieve_payments, on: :member
    get :archieved_transactions, on: :collection
  end
  resources :groups
  devise_for :users

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
