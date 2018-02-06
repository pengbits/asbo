Given("a Platform with these attributes") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

When("I refresh the Platform") do
  @platform.refresh
end

Then("the episodes list should contain new episodes") do
  expect(@platform.episodes.length).not_to be_zero 

end

