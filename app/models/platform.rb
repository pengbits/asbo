require 'Nokogiri'

class Platform < ApplicationRecord
  has_many :episodes
  
  attr_accessor :attribute_map
  SELECTOR_WITH_ATTR_REGEX = /(.+)\s*\[(.+)\]/

  def create_episodes_from_html(doc)
    @doc = Nokogiri::HTML(doc)
    eps = @doc.css(attribute_map['item']).collect { |item| episode_attrs(item) }
    episodes.create(eps)
  end
  
  def episode_attrs(item)
    episode_attrs = attribute_map.inject({}) do |ep, pair|
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
  
  def to_json(opts={})
    super opts || {}
  end
end
