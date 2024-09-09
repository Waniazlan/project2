Rails.application.routes.draw do
  resources :categories do
    resources :products, only: [:new, :create]
  end

  root "categories#index"
end
