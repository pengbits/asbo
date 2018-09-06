Given("this html for multiple entries") do |html|
  @html = html
end

When("I add some episodes") do |episodes|
  @platform.episodes.create! episodes.hashes
  @initial_ep_length = @platform.episodes.length
end

When("I refresh the Platform") do
  @platform = @platform || @platforms.first
  @platform.refresh
end

Then("the episodes list should contain some episodes") do
  expect(@platform.episodes.length).not_to be_zero
end

Then("only the new episodes are added to the platform") do |uniques|
  # Platform.episodes[9,12] => [{},{},{}]
  slice = (@platform.episodes[@initial_ep_length,@platform.episodes.length]).collect do |e|
    obj = {}
    obj['name'] = e.name
    obj['date_str'] = e.date.strftime(@platform.date_format)
    obj
  end
  expect(slice).to match_array(uniques.hashes)
end

Given("the platform's last_page is {int}") do |p|
  @platform.last_page = p
end


Then("the platform's last_page is incremented to {int}") do |p| 
  expect(@platform.last_page).to eq(p)
end

