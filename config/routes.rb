Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#welcome"
  get "/home" => "pages#home"

  # Session Routes -------------------------------------------
  
  # Login Form
  get "/login" => "session#new"
  # Login Form submits here, do authentication & create session
  post "/login" => "session#create"
  # Logout, delete session
  delete "/login" => "session#destroy"
  
  # USER CRUD -------------------------------------------
  resources :users # Create users route

  # POST CRUD -------------------------------------------
  resources :posts

  # COMMENT CRUD -------------------------------------------
  resources :comments
  
end