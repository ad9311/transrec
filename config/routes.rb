Rails.application.routes.draw do
  root 'bank_accounts#index'

  devise_for :users

  resources :bank_accounts, only: %i[index show new create]
  get 'change_cycle', to: 'bank_accounts#change_cycle'

  resources :transactions, only: %i[create]
  get 'transactions/new_deposit'
  get 'transactions/new_expense'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
