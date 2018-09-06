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

Given("the platform has a lastPage") do 
  expect(@platform.lastPage).to_be(0)
end

Then("the platform's lastPage is incremented") do 
end

