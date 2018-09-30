class MoviesController < ApplicationController
  before_action :movie, only: [:show, :update, :destroy]

  def index
    json_response(current_user.movies)
  end

  def show
    json_response(@movie)
  end

  def create
    @movie = current_user.movies.create!(movie_params)
    json_response(@movie, :created)
  end

  def update
    @movie.update(movie_params)
    head :no_content
  end

  def destroy
    @movie.destroy
    head :no_content
  end

  private

  def movie_params
    params.permit(:title, :genre, :director, :prod_year, :rating)
  end

  def movie
    @movie ||= current_user.movies.find(params[:id]) if current_user
  end
end
