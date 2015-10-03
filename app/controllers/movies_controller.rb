class MoviesController < ApplicationController
  before_action :admin_required, except: [:index, :show]
  def index
    @movie = Movie.all
  end

  def show
    @movie = Movie.find_by(id: params[:id])

    if @movie.reviews.blank?
      @avg_review = 0
    else
      @avg_review = @movie.reviews.average(:rating).round(2)
    end
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:success] = "Your movie has been created"
      redirect_to @movie
    else
      render 'new'
    end
  end

  def update
    @movie = Movie.find_by(id: params[:id])

    if @movie.update(movie_params)
      flash[:success] = "Your movie has been edited"
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy

    flash[:info] = "Your movie has been deleted"
    redirect_to root_path
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image)
  end
end
