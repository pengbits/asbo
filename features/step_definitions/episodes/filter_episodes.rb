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

Given("using a filter parameter {string}") do |param|
  @filter = param.downcase!
end

When("I load the episodes endpoint") do
  url = @filter.nil? ? episodes_path : episodes_filtered_path(:filter => @filter)
  puts "GET #{url}"
  get url
  @response = JSON.parse(last_response.body)
end

Then("the response should include some episodes with the search term in their name") do
  @complete = @response.is_a?(Hash) ? @platform.episodes : @episodes
  @filtered = @response.is_a?(Hash) ? @response['episodes'] : @response 
  puts "found these episodes: '%s' " % @filtered.collect{|ep| ep['name'] }.join("', '")
  expect(@filtered.length).not_to eq(@complete.length)
  expect(@filtered.length).to be > 0
end