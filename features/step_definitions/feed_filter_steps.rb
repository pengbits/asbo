Given("a platform") do
  @platform = Platform.create!(:key => 'nts', :name => 'nts.live')
end

Given("episodes") do |episode_attrs|
  @platform.episodes.build episode_attrs.hashes
  @platform.save!
end


Given("a search term: {string}") do |string|
  @query = string
end

When("I view the platform's episodes_with_name_matching property") do
  @episodes = @platform.episodes_with_name_matching(@query)
end

Then("it should include some episodes with the search term in their name") do 
  expect(@episodes.length).not_to be_zero
  # pending # Write code here that turns the phrase above into concrete actions
end
