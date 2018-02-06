class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
    render json: @platforms.to_json
  end

  def show
    @platform = Platform.find_by_key(params[:key])
    render json: @platform.to_json
  end
  
end
