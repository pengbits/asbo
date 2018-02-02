Given("a platform") do
  @platform = Platform.create!(:key => 'nts', :name => 'nts.live')
  puts @platform.id
end

Given("episodes") do |episode_attrs|
  # @platform.episodes = Episode.create!(eps.hashes)
  @platform.episodes.build episode_attrs.hashes
  @platform.save!
end


Given("a search term: {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I view the platform's episodes property with a filter") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("it should only include episodes with {string} in their name") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
