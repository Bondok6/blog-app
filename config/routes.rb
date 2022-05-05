Rails.application.routes.draw do
  # get '/users/', to: 'users#index'
  # get '/users/:id', to: 'users#show'

  # get 'users/:user_id/posts', to: 'posts#index'
  # get 'users/:user_id/posts/:id', to: 'posts#show'

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end  

  resources :posts
end
