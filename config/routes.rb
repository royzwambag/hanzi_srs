require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  resources :reviews, only: [:index, :show, :update] 

  resources :characters
  resources :phrases
  
  mount Sidekiq::Web => "/sidekiq"
end
