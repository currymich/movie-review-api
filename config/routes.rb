Rails.application.routes.draw do
  resources :movies
  resources :users, only: [:create, :show, :destroy] do
    collection do
      post '/login', to: 'users#login'
    end
  end
end
