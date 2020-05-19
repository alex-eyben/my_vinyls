Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  get "/vinyls", to: "vinyls#index"
  get "/vinyls/:id", to: "vinyls#show"

=======
  get 'bookings/new', to: 'bookings#new'
  post 'bookings', to: 'bookings#create'
>>>>>>> master
end
