class Media
  TYPES = %w(mixcloud soundcloud)
  HTTP_TRIM_REGEX = /^(http|https):\/\/(www\.)*/
  TYPES_REGEX = Regexp.new("^#{TYPES.join('|')}")

  def self.from_url(url)
    trim = url.gsub(HTTP_TRIM_REGEX, '')
    type = TYPES_REGEX =~ trim ? trim[TYPES_REGEX] : 'unrecognized'
      media         = {}
      media['type'] = type
      media['url']  = url
    media
  end
end
