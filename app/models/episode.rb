class Episode < ApplicationRecord
  belongs_to :platform
  validates :date, presence: true
  before_validation :parse_date
  attr_accessor :date_str
  
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
    puts "Ep#parse_date #{date} #{date_format}"
    
    Date.strptime(date.gsub(/(th)*(rd)*g/), date_format)
  end
end
