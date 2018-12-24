Rails.application.routes.draw do
  root 'games#index'

  get 'search', to: 'games#search'
  post 'search', to: 'games#search'
end
