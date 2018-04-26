Rails.application.routes.draw do
  root 'welcome#index'

  resources :songs, except: [:show]

  resources :mixes do
    member do
      patch 'add_song'
      put 'add_song'
      delete 'remove_song'
    end
  end

  resources :users do
    member do
      post 'send_friend_request'
      patch 'accept_friend_request'
      put 'accept_friend_request'
      delete 'delete_friend'
    end
  end
  get '/friend_requests', to: 'users#friend_requests'

  # sessions routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
