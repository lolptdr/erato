Rails.application.routes.draw do
  resources :sounds do
    post :compound, :on => :collection
  end
  # post '/sounds', to: 'sounds#compound'

  resources :carbons, only: [:index, :new, :create, :destroy]
  resources :waveforms, only: [:index, :new, :create, :destroy]
  root "carbons#index"
end
