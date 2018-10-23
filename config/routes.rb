Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

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

  end
end
