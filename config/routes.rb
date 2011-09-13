Pitch::Application.routes.draw do
  
  resources :identities
  resources :templates
  resources :emails

  
  match "/auth/:provider/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => :signout 

  root :to => 'main#index'
end
