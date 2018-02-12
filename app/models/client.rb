class Client
  include HTTParty
  # todo - handle pagination options?
  
  def initialize(opts={})
    if opts[:url].nil? || opts[:listener].nil?
      raise "can't create a client in Platform without setting a url and listener"
    else
      @url = opts[:url]
      @listener = opts[:listener]
    end
  end
  
  def get
    puts "client#get #{@url}"
    @response = HTTParty.get(@url)
    @listener.ready((@response.code == 200 )? {
      success: true,
      body: @response.body
    }:{
      success: false,
      code: @response.code,
      message: @response.message
    })
  end
end