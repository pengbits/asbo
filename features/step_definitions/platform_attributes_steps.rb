Given("this attribute map for the platform") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

Given("this html") do |html|
  @html = html
end

When("i call get_episodes_from_html on the platform") do
  puts @platform.get_episodes_from_html(@html)
end

Then("I should get an episode with these attributes:") do |attrs|
  # @attrs = JSON.parse(attrs)
  # expect(@episode).to have_attributes(@attrs)
  pending
end
