Rails.application.routes.draw do
  
  # get 'movies/index'
  # get 'movies/show'
  resources :movies do
    resources :comments
    resources :actors
  end
end
