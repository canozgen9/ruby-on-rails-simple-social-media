Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :likes
    end
  end
  root 'home#index'
  post '/signup', to: 'users#create'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/index', to: 'home#index'
  post '/index', to: 'home#index'
  post '/like', to: 'likes#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
