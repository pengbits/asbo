Given("this attribute map for the platform") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

Given("this html") do |html|
  @html = html
end

Given("these attribute maps for the platforms") do |attr_array|
  @platforms = Platform.create(JSON.parse(attr_array))
end

Given("this html for each") do |string|
  @doc = string.split(/_BREAK_\n*/)
end

When(/^I call create_episodes_from_html on platform\s*(\d+)*$/) do |index|
  i = index-1
  @platform = @platform || @platforms[i]
  @html     = @doc ? @doc[i] : @html

  @platform.create_episodes_from_html(@html)
  puts @platform.episodes.length
  puts @platform.episodes.collect {|e| "|#{e.name}|#{e.date}|"}.join "\n"

  expect(@platform.episodes).not_to be_empty
end

Then("I should get an episode with these attributes") do |attrs|
  @attrs    = JSON.parse(attrs)
  @platform = @platform || @platforms.find {|p|p.id == attrs['platform_id']}
  @episode  = @platform.episodes.first
  # iterate over attributes so we can specify date format for comparison
  @ep_attrs = @episode.attributes.merge({
    "date" => @episode.attributes['date'].to_s
  })
  expect(@ep_attrs).to include(@attrs)
end
