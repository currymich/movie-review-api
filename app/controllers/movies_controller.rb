class MoviesController < ApplicationController
  def reviews
    render json: {reviews: Movie.find(params[:id]).reviews}
  end

  def index
    render json: {movies: Movie.all}
  end

  def show
    render json: {movie: Movie.find(params[:id])}
  end

  def create
    movie = Movie.new(movie_params)

    if movie.save
      render json: {status: 201, movie: movie}
    else
      render json: {status: 422}
    end
  end

  def update
    movie = Movie.find(params[:id])

    if movie.update(movie_params)
      render json: {status: 200, movie: movie}
    else
      render json: {status: 422}
    end
  end

  def destroy
    movie = Movie.find(params[:id])

    movie.destroy
  end

  private
    def movie_params
      params.required(:movie).permit(:title, :poster)
    end
end
