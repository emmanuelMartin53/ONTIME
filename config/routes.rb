Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/users/:id/points', to: 'pages#points', as: 'user_points'

  resources :flights do
   resources :alerts, only: [:new, :create, :index]
   resources :tasks, only: [:index, :create, :new, :update], module: :flights
  end


  resources :tasks

  resources :alerts, only: [:show, :edit, :update, :destroy] do
    member do
      patch :upvote
      patch :downvote
    end
  end


  # Defines the root path route ("/")

end
