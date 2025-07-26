Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {
  registrations: 'users/registrations'
  }

  namespace :admin do
    get 'dashboard', to: 'users#index'  # 👈 This is your dashboard page
    resources :categories
    resources :category_accesses, only: [:create, :destroy]
    resources :users, only: [:index, :destroy, :create, :update] do
      member do
        patch :approve
        patch :revoke
      end
    end
  end

  
  resources :videos
  resources :announcements
  
end
