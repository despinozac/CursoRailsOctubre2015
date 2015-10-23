Rails.application.routes.draw do
  
  resources :people do
    resources :addresses
    member do
      get 'form_address'
      post 'add_address'
    end
  end

  resources :companies
  #get "/people" => "foo#bar"
end
