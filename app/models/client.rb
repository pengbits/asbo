require 'uri'

class Client
  include HTTParty
  # todo - handle pagination options?
  
  def initialize(opts={})
    if opts[:url].nil? || opts[:listener].nil?
      raise "can't create a client in Platform without setting a url and listener"
    else
      @base_url   = opts[:url]
      @pagination = opts[:pagination]
      @listener   = opts[:listener]
    end
    puts "created #{@base_url}, #{@pagination}"
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
  
  def url(page = nil)
    page.nil? ? @base_url : paginate(page)
  end
  
  # pagination rules could be her 
  # - params to append to url
  # {"param" : "page"}
  # - a route (a path to add to the url)
  # {"route" : "/page/:page"}
  # - combination of either with a custom url for paginated results
  # {"route" : "/page/:page", "url": "http://www.radarradio.com/wp-admin/admin-ajax.php...."}
  # {"param" : "pageNumber",  "url": "http://www.radarradio.com/wp-admin/admin-ajax.php...."}
  
  def paginate(page)
    if !@pagination 
      return @base_url
    end
    base_url = @pagination['url'] ? @pagination['url'] : @base_url

    if @pagination['route']
      pattern = @pagination['route']
      if pattern =~ /:page/
        return "#{base_url}#{pattern.gsub(/:page/, page.to_s)}"
      end
    elsif @pagination['param']
      pattern = @pagination['param']
      edit = URI(base_url)
      join = edit.query.nil? ? '' : '&'
      edit.query = "#{edit.query}#{join}#{pattern}=#{page}" 
      return edit.to_s
    end
  end
  
end