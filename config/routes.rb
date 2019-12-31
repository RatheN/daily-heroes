Rails.application.routes.draw do
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#omniauth'

  root 'welcome#home'
  
  resources :commitments
  resources :users 
  resources :pledges do
    resources :commitments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
