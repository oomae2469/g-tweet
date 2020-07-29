Rails.application.routes.draw do
  devise_for :users
  root 'tweets#top'
  resources :tweets do
    resources :comments, only: :create
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
