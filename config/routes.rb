Rails.application.routes.draw do
  root to: redirect("/cars")
  
  resources :cars, only: [:index, :show, :create, :update, :destroy, :new]
  
end
