require 'Nokogiri'

class Episode < ApplicationRecord
  belongs_to :platform
  
  def get attribute_selector_map 
    
  end
  
  def self.from_html(html)
    @doc = Nokogiri::HTML(html)
    @collection = @doc.css('.nts-grid-item').collect do |item|
      Episode.create({
        name:   item.css('.nts-grid-item__img img').attr('alt').to_s,
        image:  item.css('.nts-grid-item__img img').attr('src').to_s,
        url:    item.css('.nts-grid-item__img__play-btn').attr('data-src').to_s,
        date:   item.css('.nts-grid-item__subtitle__left').text.to_s
      })
    end
    @collection.length == 1 ? @collection.last : @collection
    
    # puts @doc
  end
  
  def to_json(opts={})
    super.to_json(opts || {only: [:name,:image,:url,:date]})
  end
end
