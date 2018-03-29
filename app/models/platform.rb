require 'client'
require 'media'

class Platform < ApplicationRecord
  has_many  :episodes
  serialize :attr_map
  serialize :pagination
  validates :url, presence: true
  
  attr_reader :client
  
  def attributes_minimal
    attributes.slice("id","nickname")
  end

  def initialize(opts={})
    super(opts)
    # puts "plaform.init #{url}"
    init_client
  end
  
  after_find do
    init_client
  end
  
  def init_client
    @client = Client.new({
      :url => url, 
      :pagination => pagination,
      :listener => self
    })
  end

  def create_episodes_from_html(doc)
    if attr_map.nil?
      raise "can't create episodes without defining an attr_map"
    else
      
      @doc = Nokogiri::HTML(doc)
      eps = @doc.css(attr_map['item']).collect do |item| 
        episode_attrs(item)
      end.select do |item|
        episode_not_in_collection? item
      end
      episodes.create(eps)
      episodes
    end
  end
  
  def episode_not_in_collection?(item)
    # puts "#{date_format} x #{item['date_str']}"
    date = Episode::parse_date(item['date_str'], date_format)
    
    episodes.empty? ?
      true : !episodes.exists?({
        date: date,
        name: item['name']
      })
  end
  
  SELECTOR_WITH_ATTR_REGEX = /(.+)\s*\[(.+)\]/
  SELECTOR_WITH_ATTR_SPLIT_REGEX = /^split\((.+)\)/
  
  def episode_attrs(item)
    episode_attrs = attr_map.inject({}) do |ep, pair|
      prop  = pair[0]
      query = pair[1]

      # dont treat the wrapper element as a property
      if prop != 'item' 
        # selectors with attributes (.wibble[src]) need to be treated accordingly
        match = SELECTOR_WITH_ATTR_REGEX.match(query)
        if(!match)
          value = item.css(query).text.to_s
        else
          attr_element = match[1]
          attr_query = match[2]
          # puts "#{prop} #{attr_element} #{attr_query}"
          # and check for freaky split('-',1) meta attr for breaking up text values
          # used in radar radio to separate 'night slugs – feb 13'
          split = SELECTOR_WITH_ATTR_SPLIT_REGEX.match(attr_query)
          if(split)
            split_attr = split[1].split(',') # '-',0
            split_attr_token = split_attr[0].gsub(/'/,'') # -
            split_attr_index = split_attr[1].to_i  # 0
            value_array = item.css(attr_element).text.split(split_attr_token)
            value = value_array[split_attr_index]
            # puts "found `#{value}` in `#{prop}` with split('#{split_attr_token}',#{split_attr_index})"
          else
            el = item.css(attr_element)
            if el.empty?
              puts "no value for #{prop} with #{attr_element}"
              value = ""
            else
              value = el.attr(attr_query).to_s
            end
          end
        end
        unless value.nil?
          value.gsub!(/(^\n)*(\n$)*(\s$)*(^\s)*/,"")
          ep[prop] = value
          
          if(prop == 'media')
            ep[prop] = Media::from_url(value)
          end
          
          if(prop == 'image')  
            ep[prop] = "#{image_base}#{value}" 
          end
        end
      end
      
      ep
    end
  end
  
  def episodes_with_name_matching(query)
    episodes.select do |ep| 
      ep.name.downcase.include?(query)
    end
  end
  
  def image_base
    uri    = URI(url)
    scheme = uri.scheme
    host   = uri.host
    return use_relative_images ? "#{scheme}://#{host}" : ''
  end
  
  def refresh(opts={})
    # for platforms that use an alt url for pagination ie radar,
    # you MUST provide a page to options or refresh fails silently..
    opts[:page] = 1 unless opts[:page]
    puts "platform#refresh GET #{@client.url(opts[:page])}"
    @client.get opts
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
