Rails.application.routes.draw do
  resources :commitments
  resources :users 
  resources :pledges do
    resources :commitments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
