class Episode < ApplicationRecord
  belongs_to :platform
  validates :date, presence: true
  before_save :parse_date
  
  def as_json(opts={})
    super(opts.merge({:except => [:created_at,:updated_at]}))
  end
  
  def parse_date
    if platform && platform.date_format
      self.date_proper = Date.strptime(self.date, platform.date_format)
    else
      raise "can't parse_date if date_format is not set on platform"
    end
  end
end
