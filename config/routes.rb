Rails.application.routes.draw do
  resources :users, except: [:destroy] do
    post '/follow', to: 'users#follow', as: 'follow'
    post '/unfollow', to: 'users#unfollow', as: 'unfollow'
  end
  get '/login', to: 'sessions#login', as: 'login'
  post '/confirm_login', to: 'sessions#confirm_login'
  post '/logout', to: 'sessions#logout', as: 'logout'

  resources :gists, only: [:index, :create] do
    resources :comments, only: [:create]
  end

  root to: 'gists#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
