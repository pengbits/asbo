class PlatformsController < ApplicationController
  def index
  end

  def show
    @platform = Platform.find_by_key(params[:key])
    render json: @platform.to_json
  end
  
end
