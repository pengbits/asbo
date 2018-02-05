require 'Nokogiri'

class Platform < ApplicationRecord
  has_many :episodes
  
  attr_accessor :attribute_map
  SELECTOR_WITH_ATTR_REGEX = /(.+)\s*\[(.+)\]/

  def get_episodes_from_html(html)
    @doc = Nokogiri::HTML(html)
    attribute_map.each do |prop,query|
      # check for attribute in css query ie
      # .nts-grid-item__img img[src]
      if query =~ SELECTOR_WITH_ATTR_REGEX
        puts "found attr in #{query}"
      else
        puts "no attr in #{query}"
      end

    end
  end
  
  def episodes_with_name_matching(query)
    episodes.select do |ep| 
      ep.name.downcase.include?(query)
    end
  end
end
