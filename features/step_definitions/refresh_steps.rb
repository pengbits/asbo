Given("a Platform with these attributes") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

Given("this document html") do |string|
  @doc_html = string
end


When("I add some episodes") do
  @platform.create_episodes_from_html @doc_html
end

When("I refresh the Platform") do
  @platform.refresh
end

Then("the episodes list should contain some episodes") do
  @last_length = @platform.episodes.length
  puts "found #{@last_length} episodes"
  expect(@last_length).not_to be_zero
end

Then("only new episodes are added to the platform") do
  puts @platform.episodes.collect {|p| p.name }
end


