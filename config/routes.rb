Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:show]
  resources :playlists

  get '/auth/spotify/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'artists#index'
end
