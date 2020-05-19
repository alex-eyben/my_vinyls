Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vinyls, only: [ :index, :show ] do
    resources :bookings, only: [ :new, :create ]
  end
end
