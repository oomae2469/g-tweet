Rails.application.routes.draw do
  devise_for :users
  root 'tweets#top'
  resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
