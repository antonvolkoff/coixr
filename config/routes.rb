Chx::Application.routes.draw do
  resources :searches, only: [:index]

  root :to => 'searches#index'
end
