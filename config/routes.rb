Rails.application.routes.draw do

  namespace :admin do
    resources :shorts, only: [:index, :show, :destroy]
    resources :user, only: [:index, :destroy, :show, :edit, :update]
    resources :admin_advertisements, only: [:index, :show, :destroy]
  end

  devise_for :users
  
  authenticated :user do
    root 'static_pages#welcome'
  end
  
  root 'static_pages#home'
  resources :shorts, only: [:show, :create, :new]
  resources :advertisements
  get 'greetings/hello'
  get ":id", to: "static_pages#redirect"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end