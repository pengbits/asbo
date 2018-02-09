class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
    render json: @platforms.to_json
  end

  def show
    platform_params
    render json: @platform.to_json
  end
  
  def refresh
    platform_params
    puts @platform.client
    @platform.refresh
    render json: @platform.episodes
  end
  
  private
  def platform_params
    @platform = Platform.find_by_key(params[:key])
  end
  
end
