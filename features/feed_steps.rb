
Given("The platform exists, and has some episodes") do
  @platform = FactoryBot.create(:platform_with_episodes, episodes_count: 5)
  expect(@platform.episodes.length).to eq(5)
end

When("I view the feed page for the platform") do
  pending
end

Then("I should get one or more episodes of shows") do
  pending # Write code here that turns the phrase above into concrete actions
end

