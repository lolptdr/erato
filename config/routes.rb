Rails.application.routes.draw do

  root "welcome#index"
  get 'about', to: "about#index"
  
  resources :uploads

  resources :sounds do
    post :compound, :on => :collection
  end
  # post '/sounds', to: 'sounds#compound'

  resources :carbons, only: [:index, :new, :create, :destroy]
  resources :waveshapes, only: [:index, :new, :create, :destroy]
end
