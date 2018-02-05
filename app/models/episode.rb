require 'Nokogiri'

class Episode < ApplicationRecord
  belongs_to :platform
  
  # todo 
  # this seems a little much for the episode itself..
  # perhaps a Parser singleton or else just move to Platform? 
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
  end
end
