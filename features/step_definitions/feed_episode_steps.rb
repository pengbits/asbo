Given("a platform with episodes") do
  @platform = FactoryBot.create(:platform_with_episodes, episodes_count: 5)
end

When("I view the platform's episodes property") do
  @platform.episodes
end

Then("there should be some episodes") do
  expect(@platform.episodes.length).to be(5)
end