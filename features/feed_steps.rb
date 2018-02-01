
Given("The platform exists, and has some episodes") do
  @platform = FactoryBot.create(:platform_with_episodes, episodes_count: 5)
end

When("I view the feed page for the platform") do
  get "/platforms/#{@platform.key}"
end

Then("I should get one or more episodes of shows") do
  expect(last_response.status).to be(204)
  # expect(JSON.parse(last_response.body)).to eq(@platform.to_json)
  # pending # Write code here that turns the phrase above into concrete actions
end


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

