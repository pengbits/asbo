class EpisodesController < ApplicationController
  def index
    @filter = params[:filter]
    @episodes = episodes_query(@filter)
    
    render json: @episodes.collect{ |ep| episode_as_json ep }
  end
  
  def show
    begin
      @episode  = Episode.find params[:id]
      render json: episode_as_json(@episode)
    rescue ActiveRecord::RecordNotFound => e
      render(:status => 500, json: {'error':e.to_s})
    end
  end
  
  private
  
  def episodes_query(filter=nil)
    filter.nil? ? Episode.includes(:platform).all : Episode.includes(:platform).where("name like ? ", "%#{@filter}%")
  end
  
  def episode_as_json(ep)
    ep.attributes_minimal.merge({
      :platform => ep.platform.attributes_minimal
    })
  end
end