class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
    render json: @platforms
  end

  def show
    render json: platform_from_params.to_json
  end
  
  def refresh
    platform_from_params.refresh
    redirect_to platform_with_episodes_path(key: @platform.key)
    puts "#{@platform.key}.refresh() found #{@platform.episodes.length} episodes"
    # render json: {episodes: @platform.episodes}
  end
  
  def show_with_episodes
    platform_from_params
    render json: @platform.to_json({:include => :episodes })
  end
  
  private
  def platform_from_params
    @platform = Platform.find_by_key(params[:key])
    @platform
  end
  
end
