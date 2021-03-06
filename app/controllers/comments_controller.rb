class CommentsController < ApplicationController
  before_action :movie
  before_action :comment, only: [:show, :update, :destroy]

  def index
    json_response(@movie.comments)
  end

  def show
    json_response(@comment)
  end

  def create
    @comment = @movie.comments.create!(comment_params)
    json_response(@comment, :created)
  end

  def update
    @comment.update(comment_params)
    head :no_content
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.permit(:subject, :body)
  end

  def comment
    if @current_user && @movie
      @comment ||= @movie.comments.find(params[:id])
    end
  end

  def movie
    @movie ||= current_user.movies.find(params[:movie_id]) if current_user
  end
end
