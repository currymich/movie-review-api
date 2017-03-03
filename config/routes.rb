Rails.application.routes.draw do
  resources :movies, only: [:index, :show] do
    collection do
      get '/:id/reviews', to: 'movies#reviews'
      get '/search', to: 'movies#search'
    end
  end
  resources :reviews
  resources :users, only: [:create, :show] do
    collection do
      post '/login', to: 'users#login'
      get '/:id/reviews', to: 'users#reviews'
    end
  end
end


# Prefix Verb        URI Pattern                          Controller#Action
#        GET         /movies/:id/reviews(.:format)        movies#reviews
# movies GET         /movies(.:format)                    movies#index
#        POST        /movies(.:format)                    movies#create
#  movie GET         /movies/:id(.:format)                movies#show

# reviews GET        /reviews(.:format)                   reviews#index
#        POST        /reviews(.:format)                   reviews#create
# review GET         /reviews/:id(.:format)               reviews#show
#        PATCH       /reviews/:id(.:format)               reviews#update
#        PUT         /reviews/:id(.:format)               reviews#update
#        DELETE      /reviews/:id(.:format)               reviews#destroy

# login  POST        /users/login(.:format)               users#login
#        GET         /users/:id/reviews(.:format)         users#reviews
#  users POST        /users(.:format)                     users#create
#   user GET         /users/:id(.:format)                 users#show
