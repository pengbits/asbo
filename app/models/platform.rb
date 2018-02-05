require 'Nokogiri'

class Platform < ApplicationRecord
  has_many :episodes
  
  attr_accessor :attribute_map
  SELECTOR_WITH_ATTR_REGEX = /(.+)\s*\[(.+)\]/

  def get_episodes_from_html(doc)
    @doc = Nokogiri::HTML(doc)
    @eps = @doc.css('.nts-grid-item').collect do |item|
      Episode.new(episode_attrs(item))
    end
  end
  
  def episode_attrs(item)
    episode_attrs = attribute_map.inject({}) do |ep, pair|
      prop  = pair[0]
      query = pair[1]
      
      if prop != 'item'
        match = SELECTOR_WITH_ATTR_REGEX.match(query)
        if !!match
          ep[prop] = item.css(match[1]).attr(match[2]).to_s
        else
          ep[prop] = item.css(query).text.to_s
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
end
