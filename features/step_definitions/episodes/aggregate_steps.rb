Given("these platforms") do
  @platforms = get_platforms
end

Given("these episodes") do |attr_array|
  Episode.create!(JSON.parse(attr_array))
end

When("I view list sorted by date") do
  @episodes = Episode.order(:date)
end

Then("the list should include episodes from both rinse and nts") do
  @nts_eps   = @episodes.select{|ep| ep.platform_id == 1}
  @rinse_eps = @episodes.select{|ep| ep.platform_id == 2}
  expect(@nts_eps).not_to be_empty
  expect(@rinse_eps).not_to be_empty
  puts "found the following episodes: nts#{@nts_eps.length}, rinse:#{@rinse_eps.length}"
  
end
