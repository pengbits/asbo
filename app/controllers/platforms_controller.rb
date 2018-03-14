class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
    render json: @platforms
  end

  def show    
    begin
      platform_from_nickname_param
      render_json_with_episodes
    rescue ActiveRecord::RecordNotFound
      render_error
    end
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
  
  def update 
    begin
      platform_from_nickname_param
      @platform.update 
    rescue Exception
      render_error
    end
  end
  
  def destroy
    begin
      platform_from_nickname_param.destroy!
      render json: {'success' => :true, :platform => @platform} 
    rescue ActiveRecord::RecordNotFound
      render_error
    end
  end
  
  def refresh
    opts = {}
    opts[:page] = params[:page] unless params[:page].nil?

    begin
      platform_from_nickname_param.refresh opts
      render_json_with_episodes
    rescue ActiveRecord::RecordNotFound
      render_error
    end
  end
  
  private
  
  def platform_from_nickname_param
    @platform = Platform.find_by!(:nickname => params[:nickname])
    @platform
  end
  
  def platform_params
    params.require(:platform).permit(
      :name,
      :attr_map,
      :url,
      :date_format,
      :pagination,
      :has_details,
      :nickname
    )
  end
  
  def render_json_with_episodes
    render json: @platform.to_json({:include => :episodes })
  end
  
  def render_error
    render(:status => 500, json: {'error':'Platform not found'})
  end
end
