Given("a Platform with these attributes") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

When("I add some episodes") do |episodes|
  @platform.episodes.create! episodes.hashes
  @ep_count = @platform.episodes.length  
end

When("I refresh the Platform") do
  @platform.refresh
end

Then("the episodes list should contain some episodes") do
  expect(@platform.episodes.length).not_to be_zero
end

Then("only the two new episodes are added to the platform") do
  # assuming that calling refresh only seconds later
  # will not result in an increase of ep length
  # since there aren't any new episodes in the feed!
  expect(@platform.episodes.length).to eq(@ep_count+2)
end


