Given("a Platform with these attributes") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

When("I add some episodes") do |episodes|
  puts "initially: #{@platform.episodes.length} episodes"
  @platform.episodes.create! episodes.hashes
  @ep_count = @platform.episodes.length  
  puts "after: #{@ep_count} episodes"
end

When("I refresh the Platform") do
  @platform.refresh
end

Then("the episodes list should contain some episodes") do
  expect(@platform.episodes.length).not_to be_zero
  puts @platform.episodes.length
  puts @platform.episodes.collect {|e| "|#{e.name}|#{e.date}|"}.join "\n"
end

Then("only the new episodes are added to the platform") do
  pending
  
end


