Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  get "/topics/new", to: "topics#new", as: :new_topic
  post "/topics", to: "topics#create", as: :topics
  get "/topics/:id", to: "topics#show", as: :topic

  post "/posts", to: "posts#create"
  get "/posts/:id", to: "posts#show", as: :post
end
