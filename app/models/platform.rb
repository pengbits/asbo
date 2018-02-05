class Platform < ApplicationRecord
  has_many :episodes

  def episodes_with_name_matching(query)
    episodes.select do |ep| 
      ep.name.downcase.include?(query)
    end
  end
end
