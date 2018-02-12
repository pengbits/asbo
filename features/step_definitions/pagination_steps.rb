Given("a platform with pagination rules") do |attrs|
  @platform = Platform.create(JSON.parse(attrs))
end

When("I call refresh with a page parameter") do
  @platform.refresh(:page => 3)
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the platform should have the correct episodes") do
  pending # Write code here that turns the phrase above into concrete actions
end