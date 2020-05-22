Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vinyls do
    resources :bookings, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
    collection do
      get :mine
    end
  end
  get "/dashboard", to: "pages#dashboard"
end
