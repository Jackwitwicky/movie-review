class ReviewsController < ApplicationController
  def new

  end

  def create
    @movie = Movie.find_by(id: params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      flash[:success] = "Your review has been posted"
      redirect_to @movie
    else
      flash[:warning] = "The review you posted appears to be empty."
      redirect_to :back
    end

  end

  private
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
