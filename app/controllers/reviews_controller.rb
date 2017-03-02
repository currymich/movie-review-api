class ReviewsController < ApplicationController

  def get_all
    render json: {users: User.all, movies: Movie.all, reviews: Review.all}
  end

  def index
    render json: Review.all
  end

end
