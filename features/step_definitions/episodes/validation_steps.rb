Given("the episode attributes") do |attrs|
  @ep_attrs = JSON.parse(attrs)
end

When("I save the episode") do
  @ep = Episode.create!(@ep_attrs)
end

Then("it should save sucessfully") do
  expect(Episode.find(@ep.id)).to be_truthy
end