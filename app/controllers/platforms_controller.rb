class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
    render json: @platforms
  end

  def show
    platform_from_key_param
    render json: @platform.to_json({:include => :episodes })
  end
  
  def create
    # begin
      # @platform = Platform.create platform_params
    # rescue Exception
      # raise "an error occcured"
    # end
    @platform = Platform.create! platform_params
    render json: @platform.to_json
  end
  
  # todo - handle pagination
  def refresh
    platform_from_key_param.refresh
    redirect_to platform_path(key: @platform.key)
    puts "#{@platform.key}.refresh() found #{@platform.episodes.length} episodes"
  end
  
  private
  
  def platform_from_key_param
    puts params[:key]
    @platform = Platform.find_by_key(params[:key])
    @platform
  end
  
  def platform_params
    params.require(:platform).permit(:name,:date_format,:url,:attr_map,:key)
  end
  
end
