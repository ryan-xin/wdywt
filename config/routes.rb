Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get "/following" => "pages#following"

  # Session Routes -------------------------------------------
  # Login Form
  get "/login" => "session#new"
  # Login Form submits here, do authentication & create session
  post "/login" => "session#create"
  # Logout, delete session
  delete "/login" => "session#destroy"
  
  # USER CRUD -------------------------------------------
  resources :users do
    # Nested routes get user id in URL
    resources :follows 
  end

  # POST CRUD -------------------------------------------
  resources :posts do
    # Nested routes get post id in URL
    resources :likes
    resources :saves
  end

  # COMMENT CRUD ----------------------------------------
  resources :comments

end
