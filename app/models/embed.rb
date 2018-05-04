class Embed
  def self.fetch(type, url)
    puts "#{type} #{url}"
    puts Media::TYPES.include?(type)
    if type.nil? || !Media::TYPES.include?(type)
      raise "invalid type"
    end
  end
end