# frozen_string_literal: true

Rails.application.routes.draw do
  resources :elections do
    get :audit, on: :member
    resources :questions, shallow: true do
      get :audit, on: :member
      resources :answers, shallow: true do
        get :audit, on: :member
      end
    end
    resources :voters, shallow: true do
      get :audit, on: :member
      get :ballot, on: :member
      post :submit, on: :member
    end
    
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
