Given("this attribute map for the platform") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

When(/^I call create_episodes_from_html on platform\s*(\d+)*$/) do |index|
  
  i = index-1
  @platform = @platform || get_platform(i)
  @html     = @html     || get_html_entry(i)
  
  @platform.create_episodes_from_html(@html)
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
