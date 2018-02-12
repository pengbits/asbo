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
    strategy  = !!@pagination['url'] ? 'url' : 'param'
    pattern   = @pagination[strategy] || ""
    
    if(strategy == 'url' && pattern =~ /:page/) 
      return "#{base_url}#{pattern.gsub(/:page/, page.to_s)}"
    elsif (strategy == 'param' && !!@pagination['param'])
      raise "must provider properly formatted url or param option"
    end
    
    base_url
  end
  
end