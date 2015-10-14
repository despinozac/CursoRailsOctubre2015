Rails.application.routes.draw do
  
  resources :people do
    member do
      get 'form_address'
      post 'add_address'
    end
  end

  #get "/people" => "foo#bar"
end
