class Episode < ApplicationRecord
  belongs_to :platform
  
  def name_contains?(query) 
    name.downcase.include? query
  end
end
