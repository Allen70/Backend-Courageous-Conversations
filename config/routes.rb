Rails.application.routes.draw do
  resources :conversations, only: [:index, :show, :create]
  post "users", to: "users#create"
  post "login", to: "authentication#login"
end
