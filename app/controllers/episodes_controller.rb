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
  
  def show
    begin
      @episode = Episode.find params[:id]
      render json: @episode
    rescue ActiveRecord::RecordNotFound => e
      render(:status => 500, json: {'error':e.to_s})
    end
  end
  
end