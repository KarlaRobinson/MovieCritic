class ActorsController < ApplicationController
  before_action :movie
  before_action :actor, only: [:show, :update, :destroy]

  def index
    json_response(@movie.actors)
  end

  def show
    json_response(@actor)
  end

  def create
    @actor = @movie.actors.create!(actor_params)
    json_response(@actor, :created)
  end

  def update
    @actor.update(actor_params)
    head :no_content
  end

  def destroy
    @actor.destroy
    head :no_content
  end

  private

  def actor_params
    params.permit(:name, :role)
  end

  def actor
    @actor ||= @movie.actors.find(params[:id]) if @movie
  end

  def movie
    @movie ||= Movie.find(params[:movie_id])
  end
end
