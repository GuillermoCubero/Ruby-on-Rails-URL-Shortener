Rails.application.routes.draw do
  resources :shorts
  root 'shorts#new'
  get 'greetings/hello'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end