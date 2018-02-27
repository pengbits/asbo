class EpisodesController < ApplicationController
  def index
    @episodes = Episode.order(:date)
    render json: @episodes
  end
end