class Media
  TYPES = %w(mixcloud soundcloud)
  HTTP_TRIM_REGEX = /^(http|https):\/\/(www\.)*/
  TYPES_REGEX = Regexp.new("^#{TYPES.join('|')}")

  def self.from_url(url)
    trim = url.gsub(HTTP_TRIM_REGEX, '')
    type = TYPES_REGEX =~ trim ? trim[TYPES_REGEX] : 'unrecognized'
    puts "Media::from_url type=#{type}"
    {type: type, url: url}
  end
end