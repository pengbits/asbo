class EpisodesController < ApplicationController
  def index
    # if filter param????
    if params[:filter]
      @filter = params[:filter]
      @episodes = Episode.where("name like ? ", "%#{@filter}%")
      
    else
      @episodes = Episode.order(:date)
    end
    
    render json: @episodes
  end
end