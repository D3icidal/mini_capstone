Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  #Products HTML
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  get '/products/:id' => 'products#show'
  post '/products' => 'products#create'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'



  namespace :api do
    #index
    get '/products' => 'products#index'
    #show
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'


    #CRUD
    get 'suppliers' => 'suppliers#index'
    get 'suppliers/:id' => 'suppliers#show'
    
    post 'suppliers' => 'suppliers#create'
    patch 'suppliers/:id' => 'suppliers#update'
    delete 'suppliers/:id' => 'suppliers#destroy'

    #Users
    post "/users" => "users#create"

    #sessions
    post "/sessions" => "sessions#create"

    #orders
    post "/orders" => "orders#create"
    get "/orders/:id" => "orders#show"
    get "/orders" => "orders#index"

    #shopping cart - cartedproducts
    post "/cartedproducts" => "carted_products#create"
    get "/cartedproducts" => "carted_products#index"

  end
end
