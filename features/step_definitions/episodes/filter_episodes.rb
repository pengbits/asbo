Given("episodes") do |episode_attrs|
  @platform.episodes.build episode_attrs.hashes
  @platform.save!
end

Given("a search term: {string}") do |string|
  @query = string
end

When("I view the platform's episodes_with_name_matching property") do
  @episodes = @platform.episodes_with_name_matching(@query)
end

Then("it should include some episodes with the search term in their name") do 
  puts "found #{@episodes.length} matches"
  puts @episodes.collect {|ep| ep.name }.join(", ")
  expect(@episodes.length).not_to be_zero
end
