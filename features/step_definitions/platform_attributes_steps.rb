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


       # I call create_episodes_from_html on platform
When(/^I call create_episodes_from_html on platform\s*(\d+)*$/) do |index|
  i = index-1
  @platform = @platform || @platforms[i]
  @html     = @doc ? @doc[i] : @html
  @platform.create_episodes_from_html(@html)
  expect(@platform.episodes).not_to be_empty
end

Then("I should get an episode with these attributes") do |attrs|
  @attrs = JSON.parse(attrs)
  @episode = @platform.episodes.first
  expect(@episode).to have_attributes(@attrs)
  puts "found '#{@episode.name}' on '#{@platform.name}'"
end
