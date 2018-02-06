Given("a Platform with these attributes") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

Given("this document html") do |string|
  @doc_html = string
end


When("I add some episodes") do |episodes|
  pending
end

When("I refresh the Platform") do
  @platform.refresh
end

Then("the episodes list should contain some episodes") do
  @last_length = @platform.episodes.length
  expect(@last_length).not_to be_zero
end

Then("only new episodes are added to the platform") do
  # assuming that calling refresh only seconds later
  # will not result in an increase of ep length
  # since there aren't any new episodes in the feed!
  # expect(@platform.episodes.length).to eq(@last_length)
  pending
end


