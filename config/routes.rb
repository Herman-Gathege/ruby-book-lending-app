Rails.application.routes.draw do
  get 'profile', to: 'users#profile'
  get '/login', to: 'sessions#new'

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  resources :books, only: [:index, :show] do
    member do
      post 'borrow'
      post 'return'
    end
  end
end  # ✅ Removed the extra `end`
