class ReviewsController < ApplicationController

  def index
    reviews = Review.all

    review_posters = Hash.new

    reviews.each do |review|
      id = review['id']
      movie_id = review['movie_id']
      review_posters[id] = Movie.find(movie_id).Poster
    end

    render json: {reviews: reviews, posters: review_posters}
  end

  def show
    render json: Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])

    if review.update(review_params)
      render json: {status: 201, review: review}
    else
      render json: {status: 422}
    end
  end

  def destroy
    review = Review.find(params[:id])

    review.destroy
    render json: {status: 204}
  end

  def newReview
    review = Review.new(review_params)

    if review.save!
      render json: {status: 201, review: review, movie: review.movie}
    else
      render json: {status: 422}
    end
  end

  def reviewsByUser
    reviews = User.find(params[:id]).reviews
    render json: {reviews: reviews}
  end

  def reviewsByMovie
    render json: {reviews: Movie.find_by_imdbID(params[:imdbID]).reviews}
  end

  private

    def review_params
      params.require(:review).permit(:title, :rating, :comments, :user_id, :movie_id, :imdbID)
    end
end
