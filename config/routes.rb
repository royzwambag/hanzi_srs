require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  resources :reviews, only: [:index, :show, :update] 

  mount Sidekiq::Web => "/sidekiq"
end
