Rails.application.routes.draw do

  namespace :admin do
    resources :shorts, only: [:index, :edit, :update, :destroy]
    resources :user, only: [:index, :destroy, :show]
    resources :admin_advertisements, only: [:index, :show, :destroy]
  end

  devise_for :users
  root 'static_pages#home'
  get 'static_pages/redirect'
  get ":id", to: "shorts#redirect_id"
  
  resources :shorts, only: [:show, :create, :new]
  resources :advertisements
  get 'greetings/hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end