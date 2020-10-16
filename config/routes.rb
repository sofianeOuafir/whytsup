Rails.application.routes.draw do
  namespace :admin do
    resources :assets
    resources :headlines do
      resources :news
    end
    resources :prices
    resources :authors
  end

  resources :headlines
  resources :followings
  resources :assets, only: [:index]
  resources :users, only: [:create]
  post 'authenticate', to: 'authentication#authenticate'
  get 'auto_login', to: 'authentication#auto_login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
