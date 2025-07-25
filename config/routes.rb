Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {
  registrations: 'users/registrations'
  }

  namespace :admin do
    resources :users, only: [:index, :destroy] do
      member do
        patch :approve
        patch :revoke
      end
    end
  end

  resources :videos
  resources :announcements
  
end
