Rails.application.routes.draw do
  devise_for :users

  root to: "users#index"

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end  

  resources :posts
end
