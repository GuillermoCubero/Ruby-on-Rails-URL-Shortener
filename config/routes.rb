Rails.application.routes.draw do

  namespace :admin do
    resources :shorts, only: [:index, :edit, :update, :destroy]
  end

  devise_for :users
  resources :user, only: [:index, :destroy, :show]
  root 'static_pages#home'
  
  resources :shorts, only: [:show, :create, :new]
  get 'greetings/hello'
  get ":id", to: "shorts#redirect_id"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end