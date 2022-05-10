Rails.application.routes.draw do

  root to: "users#index"

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end  

  resources :posts
end
