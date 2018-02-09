require 'client'

class Platform < ApplicationRecord
  has_many :episodes
  serialize :attr_map
  validates :url, presence: true
  
  attr_reader :client
  
  SELECTOR_WITH_ATTR_REGEX = /(.+)\s*\[(.+)\]/

  def initialize(opts={})
    super(opts)
    # puts "plaform.init #{url}"
    init_client
  end
  
  after_find do
    init_client
  end
  
  def init_client
    @client = Client.new({:url => url, :listener => self})
  end

  def create_episodes_from_html(doc)
    if attr_map.nil?
      raise "can't create episodes without defining an attr_map"
    else
      @doc = Nokogiri::HTML(doc)
      eps = @doc.css(attr_map['item']).collect do |item| 
        episode_attrs(item)
      end.reject do |item|
        episodes.exists?(name: item['name'])
      end
      episodes.create(eps)
      episodes
    end
  end
  
  def episode_attrs(item)
    episode_attrs = attr_map.inject({}) do |ep, pair|
      prop  = pair[0]
      query = pair[1]

      # dont treat the wrapper element as a property
      if prop != 'item' 
        # selectors with attributes (.wibble[src]) need to be treated accordingly
        match = SELECTOR_WITH_ATTR_REGEX.match(query)
        ep[prop] = !!match ?
          item.css(match[1]).attr(match[2]).to_s :
          ep[prop] = item.css(query).text.to_s
      end
      
      ep
    end
  end
  
  def episodes_with_name_matching(query)
    episodes.select do |ep| 
      ep.name.downcase.include?(query)
    end
  end
  
  def refresh
    @client.get
  end
  
  def ready(result)
    puts "platform#ready"
    if result[:success]
      return create_episodes_from_html result[:body]
    else
      raise "#{result[:code]} error\n #{result[:message]} "
    end
  end
end
