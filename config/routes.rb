Rails.application.routes.draw do
  root 'players#new'

  get 'search', to: 'games#search'
  get 'checkwin', to: 'games#checkWin'
  post 'search', to: 'games#search'

  resources :players, only: [:new, :create]
  resources :games, only: [:show]
  resources :scores, only: [:index]
end
