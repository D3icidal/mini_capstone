Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  namespace :api do
    get '/all' => 'products#show_all'
    get '/iPhone' => 'products#iphone'
    get '/iphone' => 'products#iphone'
  end
end
