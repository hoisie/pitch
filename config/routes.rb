Pitch::Application.routes.draw do
  
  resources :identities
  resources :templates
  resources :emails

  root :to => 'main#index'
end
