Given("these episodes") do |attr_array|
  Episode.create!(JSON.parse(attr_array))
end

When(/I visit the episodes index\s*(with filter (.+))*/) do |filter|
  puts filter || 'no filter'
  get episodes_path
  @episodes = JSON.parse(last_response.body)
end

Then("the list should include episodes from both rinse and nts") do
  @nts_eps   = @episodes.select{|ep| ep['platform_id'] == 1}
  @rinse_eps = @episodes.select{|ep| ep['platform_id'] == 2}
  expect(@nts_eps).not_to be_empty
  expect(@rinse_eps).not_to be_empty
  puts "found the following episodes: nts#{@nts_eps.length}, rinse:#{@rinse_eps.length}"
end


Then("the list should include episodes with {string} in the name") do |filter|
  pending # Write code here that turns the phrase above into concrete actions
end

