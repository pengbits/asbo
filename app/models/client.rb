class Client
  include HTTParty

  def initialize(opts={})
    if opts[:url].nil? || opts[:listener].nil?
      raise "can't create a client in Platform withotu setting a url and listener"
    else
      @url = opts[:url]
      @listener = opts[:listener]
    end
  end
  
  def get
    @response = HTTParty.get(@url)
    @listener.ready((@response.code == 200 )? {
      success: true,
      body: @response.body
    }:{
      success: false,
      code: @response.code
    })
  end
end