class MediaController < ApplicationController
  def fetch_embed
    Embed::fetch(media_params[:type], media_params[:url])
  end
  
  private
  def media_params    
    params.require(:media).permit(:type, :url)
  end
end