Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end

    resources :categories do
      resources :products
    end
  end


