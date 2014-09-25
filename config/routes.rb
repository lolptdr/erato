Rails.application.routes.draw do
  get 'sounds/new'

  resources :carbons, only: [:index, :new, :create, :destroy]
  root "carbons#index"
end
