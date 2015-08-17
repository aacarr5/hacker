Rails.application.routes.draw do

  resources :users, only: [:new, :show, :create]
  resources :posts do
    resources :comments, only: [:new, :edit, :delete]
  end

end
