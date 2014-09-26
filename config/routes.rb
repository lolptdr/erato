Rails.application.routes.draw do
  resources :sounds

  resources :carbons, only: [:index, :new, :create, :destroy]
  root "carbons#index"
end
