Rails.application.routes.draw do
  resources :followings
  resources :assets
  post 'authenticate', to: 'authentication#authenticate'
  get 'auto_login', to: 'authentication#auto_login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
