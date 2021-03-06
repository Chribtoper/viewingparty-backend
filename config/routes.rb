Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :rooms do
        resources :messages
        resources :youtubes
        resources :users
      end
      resources :youtubes
      resources :user_rooms
      resources :messages
      resources :users, only: [:create]
      resources :user_rooms
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      # mount ActionCable.server => '/cable'
    end
  end
  mount ActionCable.server => '/cable'
end
