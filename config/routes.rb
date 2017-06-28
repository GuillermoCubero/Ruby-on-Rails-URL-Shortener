Rails.application.routes.draw do
<<<<<<< HEAD
  root 'static_pages#home'
  get 'greetings/hello'
  devise_for :users
  resources :user, only: [:index, :destroy, :show, :update]
  resources :shorts
  resources :advertisements
  get 'static_pages/manageadvertisements'
=======

  namespace :admin do
    resources :shorts, only: [:index, :edit, :update, :destroy]
    resources :user, only: [:index, :destroy, :show]
  end

  devise_for :users
  root 'static_pages#home'
  
  resources :shorts, only: [:show, :create, :new]
  get 'greetings/hello'
>>>>>>> master
  get ":id", to: "shorts#redirect_id"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end