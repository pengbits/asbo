class MediaController < ApplicationController
  def fetch_embed
    @embed = Embed.new
    begin 
      @json = @embed.fetch(media_params[:type], media_params[:url])
      render json: @json
      
    rescue RuntimeError => e
      render json: {
        status: 500,
        error: e.message
      }
    end
  end
  
  private
  def media_params    
    params.require(:media).permit(:type, :url)
  end
end