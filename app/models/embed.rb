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
    
    @response = resolve_embed_from_url(type, url)
    if @response.code == 200 
      return @response.body
    else
      raise "#{@response.error}"
    end
  end
  
  private
  
  def resolve_embed_from_url(type, url)
    case type
      when 'soundcloud'
        return HTTParty.get "http://soundcloud.com/oembed?format=json&url=#{url}&iframe=true"
      when 'mixcloud'
        raise "mixcloud not supported yet, sorry"
    end
  end
  
end