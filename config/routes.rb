require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  resources :reviews, only: [:index, :show, :update] 

  resources :characters, except: [:show]
  resources :phrases, except: [:show]
  
  mount Sidekiq::Web => "/sidekiq"
end
