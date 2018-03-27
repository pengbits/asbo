class Episode < ApplicationRecord
  belongs_to :platform
  validates :date, presence: true

  before_validation :parse_date
  serialize :media
  attr_accessor :date_str
  validate :media_or_details_present
  
  def attributes_minimal
    attributes.slice("id","name","url","media","image","date")
  end
  
  def as_json(opts={})
    super(opts.merge({:except => [:created_at,:updated_at]}))
  end
  
  def parse_date
    # puts "episode#parse_date '#{@date_str}' with '#{platform.date_format}'"

    if platform && platform.date_format
      self.date = Episode::parse_date(@date_str, platform.date_format)
    else
      raise "can't parse_date if date_format is not set on platform"
    end
  end
  
  def self.parse_date(date, date_format)
    begin
      str = Episode::strip_ordinal(date)
      return Date.strptime(str, date_format)
    rescue
    end    
  end
  
  private
  def media_or_details_present
    if media.to_s.empty? and details.to_s.empty?
      errors.add(:base, "must provide either media or details")
    end
  end
  
  def self.strip_ordinal(str)
    # "23rd Feb" 
    # [st,nd,rd,th] => [stndrh]{2}
    str.gsub(/((\d+)[stndrh]{2})/,'\2') 
    # puts "'#{str}' => '#{stripped}'"
    # stripped 
  end

end

