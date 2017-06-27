Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :payforms, only: [:index, :edit, :new, :create, :update, :show, :destroy]
  resources :areas, only: [:index, :edit, :new, :create, :update, :show, :destroy]
  resources :outlays, only: [:index, :edit, :new, :create, :update, :show, :destroy]

  resources :payforms do
  	resources :outlays
  end

  resources :areas do
  	resources :outlays
  end

  root "outlays#index"
end