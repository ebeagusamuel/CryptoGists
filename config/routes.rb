Rails.application.routes.draw do
  resources :users do
    post '/follow', to: 'users#follow', as: 'follow'
    post '/unfollow', to: 'users#unfollow', as: 'unfollow'
  end
  get '/login', to: 'users#login', as: 'login'
  post '/confirm_login', to: 'application#confirm_login'
  post '/logout', to: 'users#logout', as: 'logout'

  resources :gists do
    resources :comments
  end

  root to: 'gists#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
