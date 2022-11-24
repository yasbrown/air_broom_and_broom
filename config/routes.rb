Rails.application.routes.draw do
  devise_for :users
  root to: "broomsticks#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/my_bookings", to: "bookings#show"
  post "/my_bookings/:id", to: "bookings#approve", as: :approve_booking
  resources :broomsticks do
    resources :reviews, only: [:new, :create, :edit, :update]
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
end
