Given("a Platform with these attributes") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

When("I refresh the Platform") do
  @platform.refresh
end

Then("the episodes list should contain new episodes") do
  ep_length = @platform.episodes.length
  expect(ep_length).not_to be_zero 
  puts rand(ep_length)
end

