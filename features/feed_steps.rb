
Given("the following platforms:") do |platforms|
  @platforms = Platform.create!(platforms.hashes)
  expect(@platforms.length).to eq(platforms.hashes.length)
end

When("I load the platform endpoint with key: {string}") do |key|
  get "/platforms/#{key}"
  @params = {:key => key}
  @response = last_response.body
  
end

Then("The response should be a JSON representation of the platform") do
  @platform = @platforms.find{|p| p.key == @params[:key] }
  expect(@response).to eq(@platform.to_json)
end


Given("a platform with episodes") do
  @platform = FactoryBot.create(:platform_with_episodes, episodes_count: 5)
end

When("I view the platform's episodes property") do
  @platform.episodes
end

Then("there should be some episodes") do
  expect(@platform.episodes.length).to be(5)
end