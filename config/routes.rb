Rails.application.routes.draw do
  resources :users
  get '/login', to: 'users#login', as: 'login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
