
Given("a platform") do
  FactoryBot.create(:platform)
end

When("I view the feed") do
  # p = FactoryBot.attributes_for(:platform)
  @platform = FactoryBot.create(:platform_with_episodes, episodes_count: 5)
  expect(@platform.episodes.length).to eq(5)
end

Then("I should get one or more episodes of shows for the platform") do
  pending # Write code here that turns the phrase above into concrete actions
end

