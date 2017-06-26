Rails.application.routes.draw do
  root 'static_pages#home'
  get 'greetings/hello'
  devise_for :users
  resources :user, only: [:index, :destroy, :show, :update]
  resources :shorts
  resources :advertisements
  get 'static_pages/manageadvertisements'
  get ":id", to: "shorts#redirect_id"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end