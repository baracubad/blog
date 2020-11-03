Rails.application.routes.draw do
  devise_for :users
  
  resources :posts do
    resources :comments, module: :posts
    resources :likes, module: :posts
  end

  resources :comments do
    resources :comments, module: :comments
    resources :likes, module: :comments
  end
  
  root 'posts#index'
end
