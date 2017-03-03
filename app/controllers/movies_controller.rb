class MoviesController < ApplicationController
  def search
    title = params[:title].split(' ').join('+')

    movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}")

    render json: {movie: movie}
  end

  def reviews
    render json: {reviews: Movie.find(params[:id]).reviews}
  end

  def index
    render json: {movies: Movie.all}
  end

  def show
    render json: {movie: Movie.find(params[:id])}
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
