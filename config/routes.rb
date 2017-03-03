Rails.application.routes.draw do
  resources :movies, only: [:index, :show, :create] do
    collection do
      get '/search', to: 'movies#search'
    end
  end
  resources :reviews, only: [:show, :index, :destroy, :update]
  resources :users, only: [:create, :show] do
    collection do
      post '/login', to: 'users#login'
      put '/edit', to: 'users#update'
    end
  end
  get 'movies/:imdbID/reviews', to: 'reviews#reviewsByMovie'
  post 'movies/:imdbID/reviews', to: 'reviews#newReview'
  get 'users/:id/reviews', to: 'reviews#reviewsByUser'
end


# Prefix Verb   URI Pattern                       Controller#Action
# GET           /movies/search(.:format)          movies#search
# GET           /movies(.:format)                 movies#index
# POST          /movies(.:format)                 movies#create
# GET           /movies/:id(.:format)             movies#show


# GET           /reviews(.:format)                reviews#index
# GET           /reviews/:id(.:format)            reviews#show
# PATCH         /reviews/:id(.:format)            reviews#update
# PUT           /reviews/:id(.:format)            reviews#update
# DELETE        /reviews/:id(.:format)            reviews#destroy
# GET           /movies/:imdbID/reviews(.:format) reviews#reviewsByMovie
# POST          /movies/:imdbID/reviews(.:format) reviews#newReview
# GET           /users/:id/reviews(.:format)      reviews#reviewsByUser


# POST          /users/login(.:format)            users#login
# PUT           /users/edit(.:format)             users#update
# POST          /users(.:format)                  users#create
# GET           /users/:id(.:format)              users#show
