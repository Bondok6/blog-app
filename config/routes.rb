Rails.application.routes.draw do
  get '/users/', to: 'users#index'
  get '/users/:id', to: 'users#show'
end
