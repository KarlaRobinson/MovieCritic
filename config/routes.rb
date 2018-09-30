Rails.application.routes.draw do

  post 'authenticate', to: 'authentication#authenticate'

  resources :movies do
    resources :comments
    resources :actors
  end
end
