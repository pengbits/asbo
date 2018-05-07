require 'uri'

class Embed
  TYPES = ['soundcloud','mixcloud']

  include HTTParty
    
  def fetch(type, url)
    if type.nil? || !TYPES.include?(type)#!Media::TYPES.include?(type)
      raise "invalid type"
    end
    
    if(url.nil?)
      raise "must provide url to Embed#fetch"
    end
    
    resolve_embed_from_url(type, url)
      
  end
  
  private
  
  def resolve_embed_from_url(type, url)
    case type
      when 'soundcloud'
        response =  HTTParty.get "http://soundcloud.com/oembed?format=json&url=#{url}&iframe=true"
        if response.code == 200
          return response.body
        else
          raise "#{response.error}"
        end
      when 'mixcloud'
        mixcloud_embed(url)
    end
  end
  
  def mixcloud_embed(url)
    path =  Media::from_url(url)['path']
    path_escaped = URI.escape(path, "/:")

    { html: "<iframe width=\"100%\" height=\"120\" src=\"https://www.mixcloud.com/widget/iframe/?hide_cover=1&light=1&feed=#{path_escaped}\" frameborder=\"0\" ></iframe>" }
  end
  
end