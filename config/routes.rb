Rails.application.routes.draw do
  resources :carbons, only: [:index, :new, :create, :destroy]
  root "carbons#index"
end
