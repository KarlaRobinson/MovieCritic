Rails.application.routes.draw do

  resources :movies do
    resources :comments
    resources :actors
  end
end
