Given("the episode attributes") do |attrs|
  @ep_attrs = JSON.parse(attrs)
end

When("I save the episode") do
  begin
    @ep = Episode.create!(@ep_attrs)
  rescue Exception => e
    @exception = e
  end
end

Then("it should save sucessfully") do
  expect(Episode.find(@ep.id)).to be_truthy
end

Then("it should fail validation") do
  expect(@exception).to be_truthy
  expect(@exception.to_s).to end_with "must provide either media or details"
end