Rails.application.routes.draw do
  root 'posts#index'

  resources :users, only: [:new, :show, :create]
  resources :posts do
    resources :comments, only: [:new, :edit, :delete,:create]
  end


end
