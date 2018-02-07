class Episode < ApplicationRecord
  belongs_to :platform
  
  def as_json(opts={})
    super(opts.merge({:except => [:created_at,:updated_at]}))
  end
end
