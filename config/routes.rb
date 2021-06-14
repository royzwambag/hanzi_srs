require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  resources :review, only: [:index, :show, :update] 

  mount Sidekiq::Web => "/sidekiq"
end
