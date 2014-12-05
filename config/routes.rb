Rails.application.routes.draw do
  root to: redirect("/search")
  
  resources :cars, only: [:index, :show, :create, :update, :destroy, :new]
  
end
