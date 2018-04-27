Rails.application.routes.draw do
  root 'welcome#index'

  resources :songs, except: [:show, :edit, :update]

  resources :mixes do
    member do
      patch '/songs/:song_id/add_song', to: 'mixes#add_song', as: :add_song
      put '/songs/:song_id/add_song', to: 'mixes#add_song'
      delete '/songs/:song_id/remove_song', to: 'mixes#remove_song', as: :remove_song
    end
  end

  resources :users do
    member do
      # Friendship routes
      post 'send_friend_request'
      patch 'accept_friend_request'
      put 'accept_friend_request'
      delete 'delete_friend'
      # Song routes
      patch '/songs/:song_id/add_song', to: 'users#add_song', as: :add_song
      put '/songs/:song_id/add_song', to: 'users#add_song'
      delete '/songs/:song_id/remove_song', to: 'users#remove_song', as: :remove_song
    end
  end
  get '/friend_requests', to: 'users#friend_requests'

  # sessions routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
