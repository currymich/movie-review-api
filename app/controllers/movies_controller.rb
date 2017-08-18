class MoviesController < ApplicationController
  def search
    title = params[:title].split(' ').join('+')

    results = HTTParty.get("https://api.themoviedb.org/3/search/multi?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&query=#{title}&page=1&include_adult=false")

    render json: {results}
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

  def create
    saved_movie = Movie.find_by_imdbID(params[:imdbID])
    if saved_movie == nil
      movie = Movie.new(movie_params)

      if movie.save
        render json: {status: 201, message: 'Saving new movie to DB', movie: movie}
      else
        render json: {status: 422, message: 'Bad Params'}
      end

    else
      render json: {message: 'Movie already exists, using saved copy', movie: saved_movie}
    end
  end


  private
    def movie_params
      params.required(:movie).permit(:Title, :Poster, :imdbID, :Genre, :Rated, :Metascore, :imdbRating, :Plot, :Year)
    end
end
