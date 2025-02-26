Rails.application.routes.draw do
  root "books#index"

  devise_for :users

  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end

  get 'profile', to: 'users#profile'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :books, only: [:index, :show, :new, :create] do
    member do
      post 'borrow'  # ✅ Borrow a book
      patch 'return' # ✅ Return a book
    end
  end
end
