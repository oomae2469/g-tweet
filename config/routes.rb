Rails.application.routes.draw do
  root 'tweets#top'
  resources :tweets, only: [:index, :new, :create]
end
