require 'uri'

class Client
  include HTTParty
  # todo - handle pagination options?
  
  def initialize(opts={})
    if opts[:url].nil? || opts[:listener].nil?
      raise "can't create a client in Platform without setting a url and listener"
    else
      @url = opts[:url]
      @pagination = opts[:pagination]
      @listener = opts[:listener]
    end
  end
  
  def get(opts={})
    @response = HTTParty.get(url(opts[:page]))
    @listener.ready((@response.code == 200 )? {
      success: true,
      body: @response.body
    }:{
      success: false,
      code: @response.code,
      message: @response.message
    })
  end
  
  def url(page=nil)
    puts paginate(@url, page)
    paginate(@url, page)
  end
  
  # pagination rules contain either 
  # - url rewrite pattern
  # "url" : "/page/:page",
  # - params to append to url
  # "param" : "p",
  def paginate(base_url, page)
    strategy = !!@pagination && !!@pagination['url']   ? 'url'   : nil
    strategy = !!@pagination && !!@pagination['param'] ? 'param' : nil
    
    if strategy
      if(strategy == 'url' && pattern =~ /:page/) 
        return "#{base_url}#{pattern.gsub(/:page/, page.to_s)}"
      elsif (strategy == 'param' && !!pattern)
        edit = URI(base_url)
        join = edit.query.nil? ? '' : '&'
        edit.query = "#{edit.query}#{join}#{pattern}=#{page}" 
        return edit.to_s
      end
    end
    
    base_url
  end
  
end