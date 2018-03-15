class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
    render json: @platforms
  end

  def show    
    begin
      platform_from_nickname_param
      render_json_with_episodes
    rescue ActiveRecord::RecordNotFound => e
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
      @platform.update platform_params
      
      render json: @platform
    rescue StandardError => e
      render_error e
    end
  end
  
  def destroy
    begin
      platform_from_nickname_param.destroy!
      render json: {'success' => :true, :platform => @platform} 
    rescue ActiveRecord::RecordNotFound => e
      render_error e
    end
  end
  
  def refresh
    opts = {}
    opts[:page] = params[:page] unless params[:page].nil?

    begin
      platform_from_nickname_param.refresh opts
      render_json_with_episodes
    rescue ActiveRecord::RecordNotFound => e
      render_error e
    end
  end
  
  private
  
  def platform_from_nickname_param
    @platform = Platform.find_by!(:nickname => params[:nickname])
    @platform
  end
  
  def platform_params
    params_ = params.require(:platform).permit(
      :id,
      :name,
      :url,
      :pagination,
      :attr_map,
      :date_format,
      :has_details,
      :nickname
    )
    
    
    puts params_['attr_map']
    params
  end
  
  def render_json_with_episodes
    render json: @platform.to_json({:include => :episodes })
  end
  
  def render_error(e)
    render(:status => 500, json: {'error':e.to_s})
  end
end
