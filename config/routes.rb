Rails.application.routes.draw do
  root "books#index"  # 👈 Sets the homepage

  devise_for :users

  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end

  get 'profile', to: 'users#profile'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'  # 👈 If handling sessions manually
  patch '/borrowings/:id/return', to: 'borrowings#return_book'


  get "up" => "rails/health#show", as: :rails_health_check

  resources :books, only: [:index, :show, :new, :create]  do
    member do
      post 'borrow'
      post 'return'
    end
  end
end
