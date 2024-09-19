Rails.application.routes.draw do
  root "categories#index"
  
  resources :rooms do
    resources :messages
  end

    resources :categories do
      resources :products
    end
  end


