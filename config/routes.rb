require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  resources :reviews, only: [:index, :show, :update] 

  namespace :admin do
    resources :characters
    resources :phrases
  end
  
  mount Sidekiq::Web => "/sidekiq"
end
