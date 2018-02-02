class Platform < ApplicationRecord
  has_many :episodes

  def episodes_with_name_matching(query)
    episodes.select {|ep| ep.name_contains? query}
  end
end
