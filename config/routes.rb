Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  # get "/home" => "pages#home"

  # Session Routes -------------------------------------------
  
  # Login Form
  get "/login" => "session#new"
  # Login Form submits here, do authentication & create session
  post "/login" => "session#create"
  # Logout, delete session
  delete "/login" => "session#destroy"
  
  # USER CRUD -------------------------------------------
  resources :users do
    resources :follows
  end

  # POST CRUD -------------------------------------------
  resources :posts do
    resources :likes
    resources :saves
  end

  # COMMENT CRUD ----------------------------------------
  resources :comments

  # FOLLOW CRUD
  

end
