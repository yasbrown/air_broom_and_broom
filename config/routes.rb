Rails.application.routes.draw do
  devise_for :users
  root to: "broomsticks#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/my_bookings", to: "bookings#show"
  post "/my_bookings/:id", to: "bookings#approve", as: :approve_booking
  resources :broomsticks do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
end



# esources :users do
#   resources :broomsticks, only: [:show, :new, :create, :destroy] do
#     resources :bookings, only: [:new, :create]
#   end
# end
# resources :bookings, only: [:destroy]
# resources :broomsticks, only: [:index]
# end
