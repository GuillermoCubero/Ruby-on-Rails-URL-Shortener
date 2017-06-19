Rails.application.routes.draw do

  devise_for :users
  resources :user, only: [:index, :destroy, :show, :update]
  root 'static_pages#home'
  
  resources :shorts
  get 'greetings/hello'
  get ":id", to: "shorts#redirect_id"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end